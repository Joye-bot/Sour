package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 菜单控制器
 *
 * @author dell
 * @date 2021/09/18
 */
@Controller
@RequestMapping(value = "/admin/menus")
public class MenuController {

    /**
     * 渲染菜单设置页面
     *
     * @return {@link String}
     */
    @GetMapping
    public String menus() {
        return "/admin/admin_menu";
    }
}
