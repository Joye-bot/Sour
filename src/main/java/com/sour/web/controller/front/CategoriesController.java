package com.sour.web.controller.front;

import com.sour.model.domain.Category;
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
 * 分类控制器
 *
 * @author nndmw
 * @date 2021/10/11
 */
@Controller
@RequestMapping(value = "/categories")
public class CategoriesController extends BaseController {

    private final CategoryService categoryService;

    private final PostService postService;

    private final TagService tagService;

    @Autowired
    public CategoriesController(CategoryService categoryService,
                                PostService postService,
                                TagService tagService) {
        this.categoryService = categoryService;
        this.postService = postService;
        this.tagService = tagService;
    }

    @GetMapping
    public String categories(Model model) {
        // 所有分类
        final List<Category> categories = categoryService.findAllCategories();
        model.addAttribute("categories", categories);

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

        return this.render("categories");
    }

    /**
     * 根据分类路径查询所有文章
     *
     * @param model   模型
     * @param cateUrl 分类路径
     * @return {@link String}
     */
    @GetMapping(value = "{cateUrl}")
    public String categories(Model model, @PathVariable("cateUrl") String cateUrl) {
        return this.categories(model, cateUrl, 1);
    }

    /**
     * 根据分类路径查询所有文章 分页
     *
     * @param model   模型
     * @param cateUrl 分类路径
     * @param page    页面
     * @return {@link String}
     */
    @GetMapping(value = "{cateUrl}/page/{page}")
    public String categories(Model model, @PathVariable("cateUrl") String cateUrl, @PathVariable("page") Integer page) {
        final Category category = categoryService.findByCateUrl(cateUrl);
        Sort sort = Sort.by(Sort.Direction.DESC, "postDate");
        int size = 10;
        if (!StringUtils.isBlank(SourConst.OPTIONS.get("index_posts"))) {
            size = Integer.parseInt(SourConst.OPTIONS.get("index_posts"));
        }
        final Pageable pageable = PageRequest.of(page - 1, size, sort);
        final Page<Post> posts = postService.findPostsByCategories(category, pageable);
        model.addAttribute("posts", posts);
        model.addAttribute("category", category);
        return this.render("index");
    }
}
