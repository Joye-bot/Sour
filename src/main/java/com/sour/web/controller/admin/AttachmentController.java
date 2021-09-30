package com.sour.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 附件控制器
 *
 * @author dell
 * @date 2021/09/18
 */
@Controller
@RequestMapping(value = "/admin/attachments")
public class AttachmentController {

    /**
     * 获取upload的所有图片资源并渲染页面
     *
     * @return {@link String}
     */
    @GetMapping
    public String attachments() {
        return "admin/admin_attachment";
    }

    /**
     * 跳转到附件页面
     *
     * @return {@link String}
     */
    @GetMapping(value = "/select")
    public String selectAttachment() {
        return "admin/widget/_attachment-select";
    }
}
