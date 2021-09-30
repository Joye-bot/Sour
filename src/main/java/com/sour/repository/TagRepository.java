package com.sour.repository;

import com.sour.model.domain.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 标签持久层
 *
 * @author nndmw
 * @date 2021/09/20
 */
public interface TagRepository extends JpaRepository<Tag, Long> {

    /**
     * 根据标签路径查询，用于验证是否已经存在该路径
     *
     * @param tagUrl 标签路径
     * @return {@link Tag}
     */
    Tag findTagByTagUrl(String tagUrl);

    /**
     * 根据标签名称查询
     *
     * @param tagName 标签名
     * @return {@link Tag}
     */
    Tag findTagByTagName(String tagName);
}
