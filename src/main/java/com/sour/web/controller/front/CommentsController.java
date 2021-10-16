package com.sour.web.controller.front;

import com.sour.model.domain.Comment;
import com.sour.model.domain.Post;
import com.sour.model.dto.SourConst;
import com.sour.service.CommentService;
import com.sour.service.MailService;
import com.sour.service.PostService;
import com.sour.service.UserService;
import com.sour.util.SourUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 评论控制器
 *
 * @author nndmw
 * @date 2021/10/15
 */
@Controller
public class CommentsController {

    private final PostService postService;

    private final CommentService commentService;

    private final UserService userService;

    private final MailService mailService;

    @Autowired
    public CommentsController(PostService postService,
                              CommentService commentService,
                              UserService userService,
                              MailService mailService) {
        this.postService = postService;
        this.commentService = commentService;
        this.userService = userService;
        this.mailService = mailService;
    }

    /**
     * 获取文章的评论
     *
     * @param postId 文章编号
     * @return {@link List}<{@link Comment}>
     */
    @GetMapping(value = "/getComment/{postId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Comment> getComment(@PathVariable Long postId) {
        Optional<Post> post = postService.findByPostId(postId);
        Sort sort = Sort.by(Sort.Direction.DESC, "commentDate");
        Pageable pageable = PageRequest.of(0, 10, sort);
        List<Comment> comments = commentService.findCommentsByPostAndCommentStatus(post.get(), pageable, 2).getContent();
        if (comments == null) {
            return null;
        }
        return comments;
    }

    /**
     * 提交新评论
     *
     * @param comment 评论
     * @param post    文章
     * @param request 请求
     * @return boolean
     */
    @PostMapping(value = "/newComment")
    @ResponseBody
    public boolean newComment(@ModelAttribute("comment") Comment comment,
                              @ModelAttribute("post") Post post,
                              HttpServletRequest request) {
        if (StringUtils.isBlank(comment.getCommentAuthor())) {
            comment.setCommentAuthor("小猪佩奇");
        }
        comment.setCommentAuthorEmail(comment.getCommentAuthorEmail().toLowerCase());
        comment.setPost(post);
        comment.setCommentDate(new Date());
        comment.setCommentAuthorIp(SourUtil.getIpAddr(request));
        comment.setIsAdmin(0);
        commentService.saveByComment(comment);

        if (StringUtils.equals(SourConst.OPTIONS.get("smtp_email_enable"), "true") &&
                StringUtils.equals(SourConst.OPTIONS.get("new_comment_notice"), "true")) {
            try {
                // 发送邮件到博主
                Map<String, Object> map = new HashMap<>();
                Optional<Post> postOptional = postService.findByPostId(post.getPostId());
                map.put("author", userService.findUser().getUserDisplayName());
                postOptional.ifPresent(value -> map.put("pageName", value.getPostTitle()));
                map.put("blogUrl", SourConst.OPTIONS.get("blog_url"));
                map.put("visitor", comment.getCommentAuthor());
                map.put("commentContent", comment.getCommentContent());
                mailService.sendTemplateMail(
                        userService.findUser().getUserEmail(), "有新的评论",
                        map, "common/mail/mail_admin.ftl"
                );
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }
}
