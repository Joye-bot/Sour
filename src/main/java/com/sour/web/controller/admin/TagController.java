package com.sour.web.controller.admin;

import com.sour.model.domain.Tag;
import com.sour.service.TagService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;
import java.util.Optional;

/**
 * 标签控制器
 *
 * @author nndmw
 * @date 2021/09/13
 */
@Controller
@RequestMapping(value = "/admin/tag")
@Slf4j
public class TagController {

    private final TagService tagService;

    @Autowired
    public TagController(TagService tagService) {
        this.tagService = tagService;
    }


    /**
     * 渲染标签管理页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping
    public String tags(Model model) {
        final List<Tag> tags = tagService.findAllTags();
        model.addAttribute("tags", tags);
        model.addAttribute("statusName", "保存");
        return "admin/admin_tag";
    }

    /**
     * 新增/修改标签
     *
     * @param tag 标签
     * @return {@link String}
     */
    @PostMapping(value = "/save")
    public String saveTag(@ModelAttribute Tag tag) {
        try {
            tagService.saveByTag(tag);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/tag";
    }

    /**
     * 跳转到修改标签页面
     *
     * @param model 模型
     * @param tagId 标签编号
     * @return {@link String}
     */
    @GetMapping(value = "/edit")
    public String toEditTag(Model model, @PathParam("tagId") Long tagId) {
        final List<Tag> tags = tagService.findAllTags();
        final Optional<Tag> optionalTag = tagService.findByTagId(tagId);
        if (optionalTag.isPresent()) {
            final Tag tag = optionalTag.get();
            model.addAttribute("statusName", "更新");
            model.addAttribute("updateTag", tag);
            model.addAttribute("tags", tags);
            return "admin/admin_tag";
        }
        return null;
    }

    /**
     * 处理删除标签的请求
     *
     * @param tagId 标签编号
     * @return {@link String}
     */
    @GetMapping(value = "/remove")
    public String removeTag(@PathParam("tagId") Long tagId) {
        try {
            final Tag tag = tagService.removeByTagId(tagId);
            log.info("删除标签：{}", tag);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/tag";
    }

    /**
     * 验证是否存在该路径
     *
     * @param tagUrl 标签路径名
     * @return boolean true：不存在，false：存在
     */
    @GetMapping(value = "/checkUrl")
    @ResponseBody
    public boolean checkTagUrlExists(@RequestParam("tagUrl") String tagUrl) {
        final Tag tag = tagService.findByTagUrl(tagUrl);
        return tag != null;
    }
}
