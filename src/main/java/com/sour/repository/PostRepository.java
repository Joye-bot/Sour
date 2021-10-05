package com.sour.repository;

import com.sour.model.domain.Post;
import com.sour.model.domain.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
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

    /**
     * 根据标签查询文章
     *
     * @param tag      标签
     * @param pageable 可分页
     * @return {@link Page}<{@link Post}>
     */
    Page<Post> findPostsByTags(Tag tag, Pageable pageable);

    /**
     * 根据文章路径查询
     *
     * @param postUrl  文章路径
     * @param postType 文章类型 post or page
     * @return {@link Post}
     */
    Post findPostByPostUrlAndPostType(String postUrl, String postType);

    /**
     * 查询之前的文章
     *
     * @param postDate   发布日期
     * @param postStatus 发布状态
     * @param postType   文章类型 post or page
     * @return {@link List}<{@link Post}>
     */
    List<Post> findByPostDateBeforeAndPostStatusAndPostTypeOrderByPostDateAsc(Date postDate, Integer postStatus, String postType);

    /**
     * 查询之后的文章
     *
     * @param postDate   发布日期
     * @param postStatus 发布状态
     * @param postType   文章类型 post or page
     * @return {@link List}<{@link Post}>
     */
    List<Post> findByPostDateAfterAndPostStatusAndPostTypeOrderByPostDateDesc(Date postDate, Integer postStatus, String postType);

    /**
     * 根据年份查询文章
     *
     * @param year 年份
     * @return {@link List}<{@link Post}>
     */
    @Query(value = "SELECT *, YEAR(post_date) AS year FROM sour_post WHERE post_status = 0 AND post_type = 'post' AND YEAR(post_date) =:year ORDER BY post_date DESC;", nativeQuery = true)
    List<Post> findPostByYear(@Param("year") String year);

    /**
     * 查询文章归档信息 根据年份
     *
     * @return {@link List}<{@link Object[]}>
     */
    @Query(value = "SELECT YEAR(post_date) AS year,COUNT(*) AS count FROM sour_post WHERE post_status = 0 AND post_type = 'post' GROUP BY YEAR(post_date) ORDER BY year DESC;", nativeQuery = true)
    List<Object[]> findPostGroupByYear();
}
