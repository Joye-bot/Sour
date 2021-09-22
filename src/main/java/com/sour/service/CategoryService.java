package com.sour.service;

import com.sour.model.domain.Category;

import java.util.List;
import java.util.Optional;

/**
 * 分类业务逻辑层
 *
 * @author nndmw
 * @date 2021/09/19
 */
public interface CategoryService {

    /**
     * 获取所有分类目录
     *
     * @return {@link List}<{@link Category}>
     */
    List<Category> findAllCategories();

    /**
     * 新增/修改分类目录
     *
     * @param category 类别
     * @return {@link Category}
     */
    Category saveByCategory(Category category);

    /**
     * 根据编号查询单个分类
     *
     * @param cateId 分类编号
     * @return {@link Optional}<{@link Category}>
     */
    Optional<Category> findByCateId(Long cateId);

    /**
     * 根据编号删除分类目录
     *
     * @param cateId 分类编号
     * @return {@link Category}
     */
    Category removeByCateId(Long cateId);

    /**
     * 根据分类目录路径查询，用于验证是否已经存在该路径
     *
     * @param cateUrl 分类目录路径
     * @return {@link Category}
     */
    Category findByCateUrl(String cateUrl);
}
