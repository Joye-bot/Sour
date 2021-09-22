package com.sour.service.impl;

import com.sour.model.domain.Category;
import com.sour.repository.CategoryRepository;
import com.sour.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * 分类业务逻辑层实现类
 *
 * @author nndmw
 * @date 2021/09/19
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    /**
     * 获取所有分类目录
     *
     * @return {@link List}<{@link Category}>
     */
    @Override
    public List<Category> findAllCategories() {
        return categoryRepository.findAll();
    }

    /**
     * 新增/修改分类目录
     *
     * @param category 类别
     * @return {@link Category}
     */
    @Override
    public Category saveByCategory(Category category) {
        return categoryRepository.save(category);
    }

    /**
     * 根据编号查询单个分类
     *
     * @param cateId 分类编号
     * @return {@link Optional}<{@link Category}>
     */
    @Override
    public Optional<Category> findByCateId(Long cateId) {
        return categoryRepository.findById(cateId);
    }

    /**
     * 根据编号删除分类目录
     *
     * @param cateId 凯特id
     * @return {@link Category}
     */
    @Override
    public Category removeByCateId(Long cateId) {
        final Optional<Category> category = this.findByCateId(cateId);
        if (category.isPresent()) {
            categoryRepository.delete(category.get());
            return category.get();
        }
        return null;
    }

    /**
     * 根据分类目录路径查询，用于验证是否已经存在该路径
     *
     * @param cateUrl 分类目录路径
     * @return {@link Category}
     */
    @Override
    public Category findByCateUrl(String cateUrl) {
        return categoryRepository.findCategoryByCateUrl(cateUrl);
    }
}
