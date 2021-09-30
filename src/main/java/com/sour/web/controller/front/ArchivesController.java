package com.sour.web.controller.front;

import com.sour.model.domain.Post;
import com.sour.model.dto.SourConst;
import com.sour.service.PostService;
import com.sour.web.controller.core.BaseController;
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
 * 归档控制器
 *
 * @author nndmw
 * @date 2021/09/28
 */
@Controller
@RequestMapping(value = "/archives")
public class ArchivesController extends BaseController {

    private final PostService postService;

    @Autowired
    public ArchivesController(PostService postService) {
        this.postService = postService;
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
}
