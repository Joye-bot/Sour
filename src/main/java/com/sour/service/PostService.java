package com.sour.service;

import com.sour.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

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


    /**
     * 获取文章列表 分页
     *
     * @param postType post or page
     * @param pageable 分页信息
     * @return {@link Page}<{@link Post}>
     */
    Page<Post> findAllPosts(String postType, Pageable pageable);

    /**
     * 获取文章列表 不分页
     *
     * @param postType post or page
     * @return {@link List}<{@link Post}>
     */
    List<Post> findAllPosts(String postType);
}
