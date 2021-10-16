package com.sour.web.controller.admin;

import com.sour.model.domain.Comment;
import com.sour.model.domain.Post;
import com.sour.model.domain.User;
import com.sour.model.dto.SourConst;
import com.sour.service.CommentService;
import com.sour.service.MailService;
import com.sour.service.UserService;
import com.sour.util.SourUtil;
import com.sour.web.controller.core.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 评论控制器
 *
 * @author nndmw
 * @date 2021/09/16
 */
@Controller
@RequestMapping(value = "/admin/comments")
@Slf4j
public class CommentController extends BaseController {

    private final CommentService commentService;

    private final UserService userService;

    private final MailService mailService;

    @Autowired
    public CommentController(CommentService commentService,
                             UserService userService,
                             MailService mailService) {
        this.commentService = commentService;
        this.userService = userService;
        this.mailService = mailService;
    }

    /**
     * 渲染评论管理页面
     *
     * @param model  模型
     * @param status 评论状态
     * @param page   当前页码
     * @param size   每页显示条数
     * @return {@link String}
     */
    @GetMapping
    public String comments(Model model,
                           @RequestParam(value = "status", defaultValue = "0") Integer status,
                           @RequestParam(value = "page", defaultValue = "0") Integer page,
                           @RequestParam(value = "size", defaultValue = "10") Integer size) {
        Sort sort = Sort.by(Sort.Direction.DESC, "commentDate");
        Pageable pageable = PageRequest.of(page, size, sort);
        Page<Comment> comments = commentService.findAllComments(status, pageable);
        model.addAttribute("comments", comments);
        // 已发布
        model.addAttribute("publicCount", commentService.findAllComments(0, pageable).getTotalElements());
        // 待审核
        model.addAttribute("checkCount", commentService.findAllComments(1, pageable).getTotalElements());
        // 回收站
        model.addAttribute("trashCount", commentService.findAllComments(2, pageable).getTotalElements());
        // 状态
        model.addAttribute("status", status);
        return "admin/admin_comment";
    }

    /**
     * 将评论移到回收站
     *
     * @param commentId 评论编号
     * @param session   session
     * @return {@link String} 重定向到/admin/comments
     */
    @GetMapping(value = "/throw")
    public String moveToTrash(@PathParam("commentId") Long commentId, HttpSession session) {
        try {
            commentService.updateCommentStatus(commentId, 2);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/comments";
    }

    /**
     * 将评论改变为发布状态
     *
     * @param commentId 评论编号
     * @param status    状态状态
     * @return {@link String} 重定向到/admin/comments
     */
    @GetMapping(value = "/revert")
    public String moveToPublish(@PathParam("commentId") Long commentId,
                                @PathParam("status") Integer status) {
        Comment comment = commentService.updateCommentStatus(commentId, 0);

        // 判断评论者的邮箱是否符合规则
        Pattern patternEmail = Pattern.compile("\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}");
        Matcher matcher = patternEmail.matcher(comment.getCommentAuthorEmail());

        // 判断是否启用邮件服务
        if (StringUtils.equals(SourConst.OPTIONS.get("smtp_email_enable"), "true") &&
                StringUtils.equals(SourConst.OPTIONS.get("comment_pass_notice"), "true")) {
            try {
                if (status == 1 && matcher.find()) {
                    Map<String, Object> map = new HashMap<>(10);
                    map.put("pageUrl", comment.getPost().getPostUrl());
                    map.put("pageName", comment.getPost().getPostTitle());
                    map.put("blogUrl", SourConst.OPTIONS.get("blog_url"));
                    map.put("blogTitle", SourConst.OPTIONS.get("blog_title"));
                    map.put("author", userService.findUser().getUserDisplayName());
                    mailService.sendTemplateMail(
                            comment.getCommentAuthorEmail(),
                            "您在" + SourConst.OPTIONS.get("blog_title") + "的评论已审核通过！",
                            map,
                            "common/mail/mail_passed.ftl"
                    );
                }
            } catch (Exception e) {
                log.error("邮件服务器未配置：{}", e.getMessage());
            }
        }
        return "redirect:/admin/comments?status=" + status;
    }

    /**
     * 删除评论
     *
     * @param commentId 评论编号
     * @param status    评论状态
     * @return {@link String} 重定向到/admin/comments
     */
    @GetMapping(value = "/remove")
    public String moveToAway(@PathParam("commentId") Long commentId,
                             @PathParam("status") Integer status) {
        try {
            commentService.removeByCommentId(commentId);
        } catch (Exception e) {
            log.error("删除评论失败：{}", e.getMessage());
        }
        return "redirect:/admin/comments?status=" + status;
    }

    /**
     * 管理员回复评论
     *
     * @param commentId      被回复的评论编号
     * @param postId         文章编号
     * @param commentContent 回复的内容
     * @param userAgent
     * @param request        请求
     * @param session
     * @return {@link String}
     */
    @PostMapping(value = "/reply")
    public String replyComment(@RequestParam("commentId") Long commentId,
                               @RequestParam("postId") Long postId,
                               @RequestParam("commentContent") String commentContent,
                               @RequestParam("userAgent") String userAgent,
                               HttpServletRequest request,
                               HttpSession session) {
        try {
            Post post = new Post();
            post.setPostId(postId);

            // 博主信息
            User user = (User) session.getAttribute(SourConst.USER_SESSION_KEY);

            // 被回复的评论
            Comment lastComment = commentService.findCommentById(commentId).get();

            // 修改被回复的评论的状态
            lastComment.setCommentStatus(0);
            commentService.saveByComment(lastComment);

            // 保存评论
            Comment comment = new Comment();
            comment.setPost(post);
            comment.setCommentAgent(user.getUserDisplayName());
            comment.setCommentAuthorEmail(user.getUserEmail());
            comment.setCommentAuthor(SourConst.OPTIONS.get("blog_url"));
            comment.setCommentAuthorIp(SourUtil.getIpAddr(request));
            comment.setCommentAuthorAvatarMd5(SourUtil.getMD5(userService.findUser().getUserEmail()));
            comment.setCommentDate(new Date());
            String lastContent = " //<a href='#'>@" + lastComment.getCommentAuthor() + "</a>:" + lastComment.getCommentContent();
            comment.setCommentContent(commentContent + lastContent);
            comment.setCommentAgent(userAgent);
            comment.setCommentParent(commentId);
            comment.setCommentStatus(0);
            comment.setIsAdmin(1);
            commentService.saveByComment(comment);

            //正则表达式判断对方的邮箱是否是正确的格式
            Pattern patternEmail = Pattern.compile("\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}");
            Matcher matcher = patternEmail.matcher(lastComment.getCommentAuthorEmail());

            // 邮件通知
            if (StringUtils.equals(SourConst.OPTIONS.get("smtp_email_enable"), "true") &&
                    StringUtils.equals(SourConst.OPTIONS.get("comment_reply_notice"), "true")) {
                if (matcher.find()) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("blogTitle", SourConst.OPTIONS.get("blog_title"));
                    map.put("commentAuthor", lastComment.getCommentAuthor());
                    map.put("pageName", lastComment.getPost().getPostTitle());
                    map.put("commentContent", lastComment.getCommentContent());
                    map.put("replyAuthor", user.getUserDisplayName());
                    map.put("blogUrl", SourConst.OPTIONS.get("blog_url"));
                    mailService.sendTemplateMail(
                            lastComment.getCommentAuthorEmail(),
                            "您在" + SourConst.OPTIONS.get("blog_title") + "的评论有了新的回复",
                            map,
                            "common/mail/mail_reply.ftl"
                    );
                }
            }
        } catch (Exception e) {
            log.error("回复的评论失败！{}", e.getMessage());
        }
        return "redirect:/admin/comments";
    }
}
