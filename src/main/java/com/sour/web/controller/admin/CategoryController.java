package com.sour.web.controller.admin;

import com.sour.model.domain.Category;
import com.sour.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.Optional;

/**
 * 分类目录控制器
 *
 * @author nnadmw
 * @date 2021/09/13
 */
@Controller
@RequestMapping(value = "/admin/category")
@Slf4j
public class CategoryController {

    public final CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    /**
     * 查询所有分类并渲染category页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping
    public String categories(Model model) {
        model.addAttribute("statusName", "保存");
        return "admin/admin_category";
    }

    /**
     * 新增/修改分类目录
     *
     * @param category 类别
     * @return {@link String}
     */
    @PostMapping(value = "/save")
    public String saveCategory(@ModelAttribute Category category) {
        try {
            categoryService.saveByCategory(category);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/category";
    }

    /**
     * 跳转到修改页面
     *
     * @param model  模型
     * @param cateId 分类编号
     * @return {@link String}
     */
    @GetMapping(value = "/edit")
    public String toEditorCategory(Model model, @PathParam("cateId") Long cateId) {
        final Optional<Category> category = categoryService.findByCateId(cateId);
        category.ifPresent(value -> model.addAttribute("updateCategory", value));
        model.addAttribute("statusName", "更新");
        return "admin/admin_category";
    }

    /**
     * 处理删除分类目录的请求
     *
     * @param cateId 分类编号
     * @return {@link String}
     */
    @GetMapping(value = "/remove")
    public String removeCategory(@PathParam("cateId") Long cateId) {
        try {
            final Category category = categoryService.removeByCateId(cateId);
            log.info("删除分类目录：{}", category);
        } catch (Exception e) {
            log.error("未知错误：{}", e.getMessage());
        }
        return "redirect:/admin/category";
    }

    /**
     * 验证分类目录路径是否已经存在
     *
     * @param cateUrl 分类目录路径
     * @return boolean true：不存在，false：存在
     */
    @GetMapping(value = "/checkUrl")
    @ResponseBody
    public boolean checkCateUrlExists(@RequestParam("cateUrl") String cateUrl) {
        final Category category = categoryService.findByCateUrl(cateUrl);
        return category != null;
    }
}
