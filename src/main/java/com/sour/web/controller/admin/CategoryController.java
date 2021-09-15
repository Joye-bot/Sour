package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 分类目录控制器
 *
 * @author nnadmw
 * @date 2021/09/13
 */
@Controller
@RequestMapping(value = "/admin/category")
public class CategoryController {

    /**
     * 查询所有分类并渲染category页面
     *
     * @return {@link String}
     */
    @GetMapping
    public String categories() {
        return "admin/admin_category";
    }
}
