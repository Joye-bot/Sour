package com.sour.web.controller.front;

import com.sour.model.domain.Post;
import com.sour.model.domain.Tag;
import com.sour.model.dto.SourConst;
import com.sour.service.CategoryService;
import com.sour.service.PostService;
import com.sour.service.TagService;
import com.sour.web.controller.core.BaseController;
import org.apache.commons.lang3.StringUtils;
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

import java.util.List;

/**
 * 标签控制器
 *
 * @author nndmw
 * @date 2021/09/29
 */
@Controller
@RequestMapping(value = "/tags")
public class TagsController extends BaseController {

    private final TagService tagService;

    private final PostService postService;

    private final CategoryService categoryService;

    @Autowired
    public TagsController(TagService tagService,
                          PostService postService,
                          CategoryService categoryService) {
        this.tagService = tagService;
        this.postService = postService;
        this.categoryService = categoryService;
    }

    /**
     * 标签
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping
    public String tags(Model model) {
        // 所有标签
        final List<Tag> tags = tagService.findAllTags();
        model.addAttribute("tags", tags);

        // 查询文章条数
        final Integer postCount = postService.findAllPosts(SourConst.POST_TYPE_POST).size();
        model.addAttribute("postCount", postCount);

        // 查询分类条数
        final Integer categoryCount = categoryService.findAllCategories().size();
        model.addAttribute("categoryCount", categoryCount);

        // 查询标签条数
        final Integer tagCount = tagService.findAllTags().size();
        model.addAttribute("tagCount", tagCount);

        return this.render("tags");
    }

    /**
     * 根据标签路径查询所有文章
     *
     * @param model  模型
     * @param tagUrl 标签路径
     * @return {@link String}
     */
    @GetMapping(value = "{tagUrl}")
    public String tags(Model model, @PathVariable("tagUrl") String tagUrl) {
        return this.tags(model, tagUrl, 1);
    }

    /**
     * 根据标签路径查询所有文章 分页
     *
     * @param model  模型
     * @param tagUrl 标签路径
     * @param page   页面
     * @return {@link String}
     */
    @GetMapping(value = "{tagUrl}/page/{page}")
    public String tags(Model model, @PathVariable("tagUrl") String tagUrl, @PathVariable("page") Integer page) {
        final Tag tag = tagService.findByTagUrl(tagUrl);
        Sort sort = Sort.by(Sort.Direction.DESC, "postDate");
        int size = 10;
        if (!StringUtils.isBlank(SourConst.OPTIONS.get("index_posts"))) {
            size = Integer.parseInt(SourConst.OPTIONS.get("index_posts"));
        }
        final Pageable pageable = PageRequest.of(page - 1, size, sort);
        final Page<Post> posts = postService.findPostsByTags(tag, pageable);
        model.addAttribute("posts", posts);
        model.addAttribute("tag", tag);
        return this.render("index");
    }
}
