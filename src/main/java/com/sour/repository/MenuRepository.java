package com.sour.repository;

import com.sour.model.domain.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 菜单持久层
 *
 * @author nndmw
 * @date 2021/09/20
 */
public interface MenuRepository extends JpaRepository<Menu, Long> {

    /**
     * 根据菜单目录路径查询，用于验证是否已经存在该路径
     *
     * @param menuUrl 菜单目录路径
     * @return {@link Menu}
     */
    Menu findMenuByMenuUrl(String menuUrl);
}
