package com.sour.web.controller.front;

import com.sour.model.domain.Post;
import com.sour.model.domain.Tag;
import com.sour.model.dto.SourConst;
import com.sour.service.CategoryService;
import com.sour.service.PostService;
import com.sour.service.TagService;
import com.sour.web.controller.core.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * 归档控制器
 *
 * @author nndmw
 * @date 2021/09/28
 */
@Controller
@RequestMapping(value = "/archives")
@Slf4j
public class ArchivesController extends BaseController {

    private final PostService postService;

    private final CategoryService categoryService;

    private final TagService tagService;

    @Autowired
    public ArchivesController(PostService postService,
                              CategoryService categoryService,
                              TagService tagService) {
        this.postService = postService;
        this.categoryService = categoryService;
        this.tagService = tagService;
    }

    /**
     * 文章归档
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping
    public String archives(Model model) {
        return this.archives(model, 1);
    }

    /**
     * 文章归档分页
     *
     * @param model 模型
     * @param page  页面
     * @return {@link String}
     */
    @GetMapping(value = "page/{page}")
    public String archives(Model model,
                           @PathVariable(value = "page") Integer page) {
        final Sort sort = Sort.by(Sort.Direction.DESC, "postDate");
        final Pageable pageable = PageRequest.of(page - 1, 5, sort);
        final Page<Post> posts = postService.findPostByStatus(0, SourConst.POST_TYPE_POST, pageable);
        model.addAttribute("posts", posts);
        return this.render("archives");
    }

    /**
     * 渲染文章详情
     *
     * @param postUrl 文章路径
     * @param model   模型
     * @return {@link String}
     */
    @GetMapping(value = "/{postUrl}")
    public String getPost(@PathVariable String postUrl, Model model) {
        final Post post = postService.findByPostUrl(postUrl, SourConst.POST_TYPE_POST);
        // 获取当前文章的发布日期
        final Date postDate = post.getPostDate();
        try {
            // 查询当前文章日期之前的所有文章
            final List<Post> beforePosts = postService.findByPostDateBefore(postDate);
            // 查询当前文章日期之后的所有文章
            final List<Post> afterPosts = postService.findByPostDateAfter(postDate);

            if (beforePosts != null && !beforePosts.isEmpty()) {
                model.addAttribute("beforePost", beforePosts.get(beforePosts.size() - 1));
            }
            if (afterPosts != null && !afterPosts.isEmpty()) {
                model.addAttribute("afterPost", afterPosts.get(afterPosts.size() - 1));
            }
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        model.addAttribute("post", post);

        // 查询文章条数
        final Integer postCount = postService.findAllPosts(SourConst.POST_TYPE_POST).size();
        model.addAttribute("postCount", postCount);

        // 查询分类条数
        final Integer categoryCount = categoryService.findAllCategories().size();
        model.addAttribute("categoryCount", categoryCount);

        // 查询标签条数
        final Integer tagCount = tagService.findAllTags().size();
        model.addAttribute("tagCount", tagCount);

        final List<Tag> tags = tagService.findAllTags();
        model.addAttribute("tags", tags);

        return this.render("post");
    }
}
