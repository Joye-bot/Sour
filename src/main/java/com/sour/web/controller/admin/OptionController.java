package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统设置控制器
 *
 * @author nndmw
 * @date 2021/09/12
 */
@Controller
@RequestMapping("/admin/option")
public class OptionController {

    /**
     * 请求跳转到option页面并完成渲染
     *
     * @return {@link String}
     */
    @GetMapping
    public String options() {
        return "admin/admin_option";
    }
}
