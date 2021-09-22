package com.sour.service.impl;

import com.sour.model.domain.Menu;
import com.sour.repository.MenuRepository;
import com.sour.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * 菜单业务层实现类
 *
 * @author nndmw
 * @date 2021/09/20
 */
@Service
public class MenuServiceImpl implements MenuService {

    private final MenuRepository menuRepository;

    @Autowired
    public MenuServiceImpl(MenuRepository menuRepository) {
        this.menuRepository = menuRepository;
    }

    /**
     * 查询所有菜单
     *
     * @return {@link List}<{@link Menu}>
     */
    @Override
    public List<Menu> findAllMenus() {
        return menuRepository.findAll();
    }

    /**
     * 新增/修改菜单
     *
     * @param menu 菜单
     * @return {@link Menu}
     */
    @Override
    public Menu saveByMenu(Menu menu) {
        return menuRepository.save(menu);
    }

    /**
     * 根据编号查询菜单
     *
     * @param menuId 菜单id
     * @return {@link Optional}<{@link Menu}>
     */
    @Override
    public Optional<Menu> findByMenuId(Long menuId) {
        return menuRepository.findById(menuId);
    }

    /**
     * 删除菜单
     *
     * @param menuId 菜单id
     * @return {@link Menu}
     */
    @Override
    public Menu removeByMenuId(Long menuId) {
        final Optional<Menu> menu = this.findByMenuId(menuId);
        if (menu.isPresent()) {
            menuRepository.delete(menu.get());
            return menu.get();
        }
        return null;
    }

    /**
     * 根据菜单目录路径查询，用于验证是否已经存在该路径
     *
     * @param menuUrl 菜单目录路径
     * @return {@link Menu}
     */
    @Override
    public Menu findByMenuUrl(String menuUrl) {
        return menuRepository.findMenuByMenuUrl(menuUrl);
    }
}
