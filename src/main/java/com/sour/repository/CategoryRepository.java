package com.sour.repository;

import com.sour.model.domain.Category;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 分类目录持久层
 *
 * @author nndmw
 * @date 2021/09/19
 */
public interface CategoryRepository extends JpaRepository<Category, Long> {

    /**
     * 根据分类目录路径查询，用于验证是否已经存在该路径
     *
     * @param cateUrl 分类目录路径
     * @return {@link Category}
     */
    Category findCategoryByCateUrl(String cateUrl);
}
