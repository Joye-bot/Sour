package com.sour.web.controller.admin;

import com.sour.model.domain.Category;
import com.sour.model.domain.Post;
import com.sour.model.domain.Tag;
import com.sour.model.dto.SourConst;
import com.sour.service.CategoryService;
import com.sour.service.PostService;
import com.sour.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 文章控制器
 *
 * @author nndmw
 * @date 2021/09/08
 */
@Controller
@RequestMapping(value = "/admin/posts")
public class PostController {

    private final PostService postService;

    private final CategoryService categoryService;

    private final TagService tagService;

    @Autowired
    public PostController(PostService postService, CategoryService categoryService, TagService tagService) {
        this.postService = postService;
        this.categoryService = categoryService;
        this.tagService = tagService;
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
}
