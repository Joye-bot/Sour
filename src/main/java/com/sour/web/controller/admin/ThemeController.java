package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 主题控制器
 *
 * @author nndmw
 * @date 2021/09/18
 */
@Controller
@RequestMapping(value = "/admin/themes")
public class ThemeController {

    /**
     * 渲染主题设置页面
     * @return {@link String}
     */
    @GetMapping
    public String themes() {
        return "admin/admin_theme";
    }

    /**
     * 编辑主题
     *
     * @return {@link String}
     */
    @GetMapping(value = "/editor")
    public String editor() {
        return "admin/admin_theme_editor";
    }
}
