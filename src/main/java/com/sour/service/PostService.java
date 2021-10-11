package com.sour.service;

import com.sour.model.domain.Category;
import com.sour.model.domain.Post;
import com.sour.model.domain.Tag;
import com.sour.model.dto.Archive;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Date;
import java.util.List;
import java.util.Optional;

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

    /**
     * 新增/保存文章
     *
     * @param post 文章
     * @return {@link Post}
     */
    Post saveByPost(Post post);

    /**
     * 根据标签查询文章
     *
     * @param tag      标签
     * @param pageable 可分页
     * @return {@link Page}<{@link Post}>
     */
    Page<Post> findPostsByTags(Tag tag, Pageable pageable);

    /**
     * 根据文章编号查询文章
     *
     * @param postId 文章编号
     * @return {@link Optional}<{@link Post}>
     */
    Optional<Post> findByPostId(Long postId);

    /**
     * 修改文章状态
     *
     * @param postId 文章编号
     * @param status 状态
     * @return {@link Post}
     */
    Post updatePostStatus(Long postId, Integer status);

    /**
     * 根据编号删除文章
     *
     * @param postId 文章编号
     * @return {@link Post}
     */
    Post removeByPostId(Long postId);

    /**
     * 根据文章路径查询
     *
     * @param postUrl  文章路径
     * @param postType 文章类型 post or page
     * @return {@link Post}
     */
    Post findByPostUrl(String postUrl, String postType);

    /**
     * 查询当前文章日期之前的所有文章
     *
     * @param postDate 发布日期
     * @return {@link List}<{@link Post}>
     */
    List<Post> findByPostDateBefore(Date postDate);

    /**
     * 查询当前文章日期之后的所有文章
     *
     * @param postDate 发布日期
     * @return {@link List}<{@link Post}>
     */
    List<Post> findByPostDateAfter(Date postDate);

    /**
     * 根据年份查询文章
     *
     * @param year 年份
     * @return {@link List}<{@link Post}>
     */
    List<Post> findPostByYear(String year);

    /**
     * 查询归档信息 根据年份
     *
     * @return {@link List}<{@link Archive}>
     */
    List<Archive> findPostGroupByYear();

    /**
     * 批量修改摘要
     *
     * @param postSummary 文章摘要
     */
    void updateAllSummary(Integer postSummary);


    /**
     * 根据分类查询文章
     *
     * @param category 分类
     * @param pageable 可分页
     * @return {@link Page}<{@link Post}>
     */
    Page<Post> findPostsByCategories(Category category, Pageable pageable);
}
