package com.sour.web.controller.front;

import com.sour.model.domain.Post;
import com.sour.model.dto.SourConst;
import com.sour.service.PostService;
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

/**
 * 首页控制器
 *
 * @author nndw
 * @date 2021/09/25
 */

@Controller
@RequestMapping(value = {"/", "index"})
public class IndexController extends BaseController {

    private final PostService postService;

    @Autowired
    public IndexController(PostService postService) {
        this.postService = postService;
    }

    /**
     * 请求首页
     *
     * @param model model
     * @return {@link String}
     */
    @GetMapping
    public String index(Model model) {
        // 调用方法渲染首页
        return this.index(model, 1);
    }

    /**
     * 首页分页
     *
     * @param model 模型
     * @param page  页面
     * @return {@link String}
     */
    @GetMapping(value = "page/{page}")
    public String index(Model model,
                        @PathVariable(value = "page") Integer page) {
        final Sort sort = Sort.by(Sort.Direction.DESC, "postDate");
        // 默认显示10条
        int size = 10;
        // 尝试加载设置选项，用于设置显示条数
        if (!StringUtils.isBlank(SourConst.OPTIONS.get("index_posts"))) {
            size = Integer.parseInt(SourConst.OPTIONS.get("index_posts"));
        }
        // 所有文章数据，分页
        final Pageable pageable = PageRequest.of(page - 1, size, sort);
        final Page<Post> posts = postService.findPostByStatus(0, SourConst.POST_TYPE_POST, pageable);
        model.addAttribute("posts", posts);

        return this.render("index");
    }
}
