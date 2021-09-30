package com.sour.model.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Objects;

/**
 * 菜单实体类
 *
 * @author nndmw
 * @date 2021/09/04
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_menu")
public class Menu implements Serializable {

    private static final long serialVersionUID = 6963139337655667065L;

    /**
     * 编号 自增
     */
    @Id
    @GeneratedValue
    private Long menuId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 菜单路径
     */
    private String menuUrl;

    /**
     * 排序编号
     */
    private Integer menuSort;

    /**
     * 图标，可选，部分主题可显示
     */
    private String menuIcon;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Menu menu = (Menu) o;
        return Objects.equals(menuId, menu.menuId) &&
                Objects.equals(menuName, menu.menuName) &&
                Objects.equals(menuUrl, menu.menuUrl) &&
                Objects.equals(menuSort, menu.menuSort) &&
                Objects.equals(menuIcon, menu.menuIcon);
    }

    @Override
    public int hashCode() {
        return Objects.hash(menuId, menuName, menuUrl, menuSort, menuIcon);
    }
}
