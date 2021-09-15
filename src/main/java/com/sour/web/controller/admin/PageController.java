package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面控制器
 *
 * @author nndmw
 * @date 2021/09/15
 */
@Controller
@RequestMapping(value = "/admin/page")
public class PageController {

    /**
     * 处理后台获取文章列表的请求
     *
     * @return {@link String}
     */
    @GetMapping
    public String pages() {
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
}
