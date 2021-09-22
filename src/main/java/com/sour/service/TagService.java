package com.sour.service;

import com.sour.model.domain.Tag;

import java.util.List;
import java.util.Optional;

/**
 * 标签业务层
 *
 * @author nndmw
 * @date 2021/09/20
 */
public interface TagService {

    /**
     * 获取所有标签
     *
     * @return {@link List}<{@link Tag}>
     */
    List<Tag> findAllTags();

    /**
     * 新增/修改标签
     *
     * @param tag 标签
     * @return {@link Tag}
     */
    Tag saveByTag(Tag tag);

    /**
     * 根据编号查询标签
     *
     * @param tagId 标签id
     * @return {@link Optional}<{@link Tag}>
     */
    Optional<Tag> findByTagId(Long tagId);

    /**
     * 根据编号移除标签
     *
     * @param tagId 标签id
     * @return {@link Tag}
     */
    Tag removeByTagId(Long tagId);

    /**
     * 根据标签路径查询
     *
     * @param tagUrl 标记的url
     * @return {@link Tag}
     */
    Tag findByTagUrl(String tagUrl);
}
