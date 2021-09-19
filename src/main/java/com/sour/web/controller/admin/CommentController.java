package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 评论控制器
 *
 * @author nndmw
 * @date 2021/09/16
 */
@Controller
@RequestMapping(value = "/admin/comments")
public class CommentController {

    /**
     * 渲染评论管理页面
     *
     * @return {@link String}
     */
    @GetMapping
    public String comments() {
        return "admin/admin_comment";
    }
}
