package com.sour.web.controller.admin;

import com.sour.model.domain.Menu;
import com.sour.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.Optional;

/**
 * 菜单控制器
 *
 * @author dell
 * @date 2021/09/18
 */
@Controller
@RequestMapping(value = "/admin/menus")
@Slf4j
public class MenuController {

    private final MenuService menuService;

    @Autowired
    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }

    /**
     * 渲染菜单设置页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping
    public String menus(Model model) {
        model.addAttribute("statusName", "保存");
        return "/admin/admin_menu";
    }

    /**
     * 新增/修改菜单
     *
     * @param menu 菜单
     * @return {@link String}
     */
    @PostMapping(value = "/save")
    public String saveMenu(@ModelAttribute Menu menu) {
        try {
            menuService.saveByMenu(menu);
        } catch (Exception e) {
            log.error("保存菜单失败：{}", e.getMessage());
        }
        return "redirect:/admin/menus";
    }

    /**
     * 跳转到修改页面
     *
     * @param model  模型
     * @param menuId 菜单编号
     * @return {@link String}
     */
    @GetMapping(value = "/edit")
    public String updateMenu(Model model, @RequestParam("menuId") Long menuId) {
        final Optional<Menu> optionalMenu = menuService.findByMenuId(menuId);
        if (optionalMenu.isPresent()) {
            final Menu menu = optionalMenu.get();
            model.addAttribute("updateMenu", menu);
            model.addAttribute("statusName", "更新");
            return "/admin/admin_menu";
        }
        return null;
    }

    /**
     * 删除菜单
     *
     * @param menuId 菜单编号
     * @return {@link String}
     */
    @GetMapping(value = "/remove")
    public String removeMenu(@PathParam("menuId") Long menuId) {
        try {
            menuService.removeByMenuId(menuId);
        } catch (Exception e) {
            log.error("删除菜单失败：{}", e.getMessage());
        }
        return "redirect:/admin/menus";
    }

    /**
     * 验证菜单目录路径是否已经存在
     *
     * @param menuUrl 菜单目录路径
     * @return boolean
     */
    @GetMapping(value = "/checkUrl")
    @ResponseBody
    public boolean checkMenuUrlExists(@RequestParam("menuUrl") String menuUrl) {
        final Menu menu = menuService.findByMenuUrl(menuUrl);
        return menu != null;
    }
}
