package com.sour.service;

import com.sour.model.domain.Menu;

import java.util.List;
import java.util.Optional;

/**
 * 菜单业务层
 *
 * @author nndmw
 * @date 2021/09/20
 */
public interface MenuService {

    /**
     * 查询所有菜单
     *
     * @return {@link List}<{@link Menu}>
     */
    List<Menu> findAllMenus();

    /**
     * 新增/修改菜单
     *
     * @param menu 菜单
     * @return {@link Menu}
     */
    Menu saveByMenu(Menu menu);

    /**
     * 根据编号查询菜单
     *
     * @param menuId 菜单编号
     * @return {@link Optional}<{@link Menu}>
     */
    Optional<Menu> findByMenuId(Long menuId);

    /**
     * 删除菜单
     *
     * @param menuId 菜单编号
     * @return {@link Menu}
     */
    Menu removeByMenuId(Long menuId);

    /**
     * 根据菜单目录路径查询，用于验证是否已经存在该路径
     *
     * @param menuUrl 菜单目录路径
     * @return {@link Menu}
     */
    Menu findByMenuUrl(String menuUrl);
}
