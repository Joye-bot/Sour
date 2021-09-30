package com.sour.web.controller.admin;

import com.sour.model.domain.Link;
import com.sour.model.domain.Post;
import com.sour.model.dto.SourConst;
import com.sour.service.LinkService;
import com.sour.service.PostService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.websocket.server.PathParam;
import java.util.List;
import java.util.Optional;

/**
 * 页面控制器
 *
 * @author nndmw
 * @date 2021/09/15
 */
@Controller
@RequestMapping(value = "/admin/page")
@Slf4j
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
        final List<Post> posts = postService.findAllPosts(SourConst.POST_TYPE_PAGE);
        model.addAttribute("pages", posts);
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
        model.addAttribute("statusName", "保存");
        model.addAttribute("links", links);
        return "admin/admin_page_link";
    }

    /**
     * 处理添加/修改友链的请求并渲染页面
     *
     * @param link 链接
     * @return {@link String}
     */
    @PostMapping(value = "/links/save")
    public String saveLink(@ModelAttribute Link link) {
        try {
            final Link backLink = linkService.saveByLink(link);
            log.info("保存成功，数据为：{}", backLink);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/page/links";
    }

    /**
     * 跳转到修改页面
     *
     * @param model  模型
     * @param linkId 友链编号
     * @return {@link String}
     */
    @GetMapping(value = "/links/edit")
    public String toEditLink(Model model, @PathParam("linkId") Long linkId) {
        final List<Link> links = linkService.findAllLinks();
        final Optional<Link> link = linkService.findByLinkId(linkId);
        model.addAttribute("statusName", "更新");
        model.addAttribute("links", links);
        link.ifPresent(value -> model.addAttribute("updateLink", value));
        return "admin/admin_page_link";
    }

    /**
     * 处理删除友情链接的请求并重定向
     *
     * @param linkId 友链编号
     * @return {@link String}
     */
    @GetMapping(value = "/links/remove")
    public String removeLink(@PathParam("linkId") Long linkId) {
        try {
            final Link link = linkService.removeByLinkId(linkId);
            log.info("删除的友情链接：{}", link);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/page/links";
    }
}
