package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 标签控制器
 *
 * @author nndmw
 * @date 2021/09/13
 */
@Controller
@RequestMapping(value = "/admin/tag")
public class TagController {

    /**
     * 渲染标签管理页面
     *
     * @return {@link String}
     */
    @GetMapping
    public String tags() {
        return "admin/admin_tag";
    }
}
