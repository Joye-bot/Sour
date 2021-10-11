package com.sour.web.controller.admin;

import com.sour.model.domain.*;
import com.sour.model.dto.LogsRecord;
import com.sour.model.dto.SourConst;
import com.sour.service.CategoryService;
import com.sour.service.LogsService;
import com.sour.service.PostService;
import com.sour.service.TagService;
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
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import java.util.List;
import java.util.Optional;

/**
 * 文章控制器
 *
 * @author nndmw
 * @date 2021/09/08
 */
@Controller
@RequestMapping(value = "/admin/posts")
@Slf4j
public class PostController extends BaseController {

    private final PostService postService;

    private final CategoryService categoryService;

    private final TagService tagService;

    private final LogsService logsService;

    private final HttpServletRequest request;

    @Autowired
    public PostController(PostService postService, CategoryService categoryService,
                          TagService tagService, LogsService logsService,
                          HttpServletRequest request) {
        this.postService = postService;
        this.categoryService = categoryService;
        this.tagService = tagService;
        this.logsService = logsService;
        this.request = request;
    }

    /**
     * 处理后台获取文章列表的请求
     *
     * @param model  模型
     * @param status 状态
     * @param page   页面
     * @param size   大小
     * @return {@link String}
     */
    @GetMapping
    public String posts(Model model,
                        @RequestParam(value = "status", defaultValue = "0") Integer status,
                        @RequestParam(value = "page", defaultValue = "0") Integer page,
                        @RequestParam(value = "size", defaultValue = "10") Integer size) {
        final Sort sort = Sort.by(Sort.Direction.DESC, "postId");
        final Pageable pageable = PageRequest.of(page, size, sort);
        final Page<Post> posts = postService.findPostByStatus(status, SourConst.POST_TYPE_POST, pageable);
        model.addAttribute("posts", posts);

        // 已发布
        model.addAttribute("publishCount", postService.findPostByStatus(0, SourConst.POST_TYPE_POST, pageable).getTotalElements());
        // 草稿
        model.addAttribute("draftCount", postService.findPostByStatus(1, SourConst.POST_TYPE_POST, pageable).getTotalElements());
        // 回收站
        model.addAttribute("trashCount", postService.findPostByStatus(2, SourConst.POST_TYPE_POST, pageable).getTotalElements());
        model.addAttribute("status", status);

        return "admin/admin_post";
    }


    /**
     * 处理跳转到新建文章页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping(value = "/new")
    public String newPost(Model model) {
        final List<Category> categories = categoryService.findAllCategories();
        final List<Tag> tags = tagService.findAllTags();
        model.addAttribute("categories", categories);
        model.addAttribute("tags", tags);
        return "admin/admin_post_md_editor";
    }

    /**
     * 添加文章
     *
     * @param post     文章
     * @param cateList 分类列表
     * @param tagList  标签列表
     * @param session  会话
     */
    @PostMapping(value = "/new/push")
    @ResponseBody
    public void pushPost(@ModelAttribute Post post,
                         @RequestParam("cateList") List<String> cateList,
                         @RequestParam("tagList") String tagList,
                         HttpSession session) {
        try {
            // 提取摘要
            int postSummary = 50;
            if (SourUtil.isNotNull(SourConst.OPTIONS.get("post_summary"))) {
                postSummary = Integer.parseInt(SourConst.OPTIONS.get("post_summary"));
            }
            if (SourUtil.htmlToText(post.getPostContent()).length() > postSummary) {
                final String summary = SourUtil.getSummary(post.getPostContent(), postSummary);
                post.setPostSummary(summary);
            }
            post.setPostDate(SourUtil.getDate());
            // 发表用户
            final User user = (User) session.getAttribute(SourConst.USER_SESSION_KEY);
            post.setUser(user);
            final List<Category> categories = categoryService.strListToCateList(cateList);
            post.setCategories(categories);
            if (StringUtils.isNoneEmpty(tagList)) {
                final List<Tag> tags = tagService.strListToTagList(StringUtils.trim(tagList));
                post.setTags(tags);
            }
            postService.saveByPost(post);
            log.info("已发表新文章：{}", post.getPostTitle());
            logsService.saveByLogs(
                    new Logs(LogsRecord.PUSH_POST, post.getPostTitle(), SourUtil.getIpAddr(request), SourUtil.getDate())
            );
        } catch (NumberFormatException e) {
            log.error("未知错误：{}", e.getMessage());
        }
    }

    /**
     * 处理移至回收站的请求
     *
     * @param postId 文章编号
     * @return {@link String} 重定向到/admin/posts
     */
    @GetMapping(value = "/throw")
    public String moveToTrash(@RequestParam("postId") Long postId) {
        try {
            postService.updatePostStatus(postId, 2);
            log.info("编号为{}的文章已被移到回收站", postId);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/posts";
    }

    /**
     * 处理文章为发布的状态
     *
     * @param postId 文章编号
     * @param status 状态
     * @return {@link String}
     */
    @GetMapping(value = "/revert")
    public String moveToPublish(@RequestParam("postId") Long postId, @RequestParam("status") Integer status) {
        try {
            postService.updatePostStatus(postId, 0);
            log.info("编号为{}的文章已改变为发布状态", postId);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/posts?status=" + status;
    }

    /**
     * 处理删除文章的请求
     *
     * @param postId   文章编号
     * @param postType 文章类型
     * @return {@link String}
     */
    @GetMapping(value = "/remove")
    public String removePost(@PathParam("postId") Long postId, @PathParam("postType") String postType) {
        try {
            final Optional<Post> post = postService.findByPostId(postId);
            postService.removeByPostId(postId);
            post.ifPresent(value -> logsService.saveByLogs(
                    new Logs(LogsRecord.REMOVE_POST, value.getPostTitle(), SourUtil.getIpAddr(request), SourUtil.getDate())
            ));
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }

        if (StringUtils.equals(SourConst.POST_TYPE_POST, postType)) {
            return "redirect:/admin/posts?status=2";
        }

        return "redirect:/admin/page";
    }

    /**
     * 更新所有摘要
     *
     * @param postSummary 文章摘要字数
     * @return boolean true：更新成功，false：更新失败
     */
    @GetMapping(value = "/updateSummary")
    @ResponseBody
    public boolean updateSummary(@PathParam("postSummary") Integer postSummary) {
        try {
            postService.updateAllSummary(postSummary);
            return true;
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
            return false;
        }
    }

    /**
     * 跳转到编辑文章页面
     *
     * @param model  模型
     * @param postId 文章编号
     * @return {@link String}
     */
    @GetMapping(value = "/edit")
    public String editPost(Model model, @PathParam("postId") Long postId) {
        final Optional<Post> post = postService.findByPostId(postId);
        post.ifPresent(value -> model.addAttribute("post", value));
        final List<Category> categories = categoryService.findAllCategories();
        model.addAttribute("categories", categories);
        return "admin/admin_post_md_editor";
    }

    /**
     * 处理预览文章的请求
     *
     * @param model  模型
     * @param postId 文章编号
     * @return {@link String}
     */
    @GetMapping(value = "/view")
    public String viewPost(Model model, @PathParam("postId") Long postId) {
        final Optional<Post> post = postService.findByPostId(postId);
        post.ifPresent(value -> model.addAttribute("post", value));
        return this.render("post");
    }
}
