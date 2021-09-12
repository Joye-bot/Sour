package com.sour.service;

import com.sour.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 文章业务层
 *
 * @author nndmw
 * @date 2021/09/08
 */
public interface PostService {

    /**
     * 根据文章状态查询 分页
     *
     * @param status   状态
     * @param postType 文章类型
     * @param pageable 可分页
     * @return {@link Page}<{@link Post}>
     */
    Page<Post> findPostByStatus(Integer status, String postType, Pageable pageable);
}
