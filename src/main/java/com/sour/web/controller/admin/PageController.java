package com.sour.web.controller.admin;

import com.sour.model.domain.Link;
import com.sour.model.domain.Post;
import com.sour.model.dto.SourConst;
import com.sour.service.LinkService;
import com.sour.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 页面控制器
 *
 * @author nndmw
 * @date 2021/09/15
 */
@Controller
@RequestMapping(value = "/admin/page")
public class PageController {

    private final PostService postService;

    private final LinkService linkService;

    @Autowired
    public PageController(PostService postService, LinkService linkService) {
        this.postService = postService;
        this.linkService = linkService;
    }

    /**
     * 处理后台获取文章列表的请求
     *
     * @return {@link String}
     */
    @GetMapping
    public String pages(Model model) {
        final List<Post> posts = postService.findAllPosts(SourConst.POST_TYPE_PAGE);
        model.addAttribute("pages", posts);
        return "admin/admin_page";
    }

    /**
     * 跳转到新建页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping(value = "/new")
    public String newPage(Model model) {
        return "admin/admin_page_md_editor";
    }

    /**
     * 获取友情链接列表并渲染页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping(value = "/links")
    public String links(Model model) {
        final List<Link> links = linkService.findAllLinks();
        return "admin/admin_page_link";
    }
}
