package com.sour.repository;

import com.sour.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * 文章持久层
 *
 * @author nndmw
 * @date 2021/09/08
 */
public interface PostRepository extends JpaRepository<Post, Long> {


    /**
     * 根据文章状态查询 分页
     *
     * @param status   状态
     * @param postType 文章类型
     * @param pageable 可分页
     * @return {@link Page}<{@link Post}>
     */
    Page<Post> findPostsByPostStatusAndPostType(Integer status, String postType, Pageable pageable);

    /**
     * 分页查询文章
     *
     * @param postType post or page
     * @param pageable 分页信息
     * @return {@link Page}<{@link Post}>
     */
    Page<Post> findPostsByPostType(String postType, Pageable pageable);

    /**
     * 查询所有文章 根据文章类型
     *
     * @param postType post or page
     * @return {@link List}<{@link Post}>
     */
    List<Post> findPostsByPostType(String postType);
}
