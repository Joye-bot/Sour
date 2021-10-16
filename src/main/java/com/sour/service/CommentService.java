package com.sour.service;

import com.sour.model.domain.Comment;
import com.sour.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

/**
 * 评论业务逻辑层
 *
 * @author nndmw
 * @date 2021/10/13
 */
public interface CommentService {

    /**
     * 查询所有的评论，用于后台管理
     *
     * @param status   状态
     * @param pageable 分页
     * @return {@link Page}<{@link Comment}>
     */
    Page<Comment> findAllComments(Integer status, Pageable pageable);

    /**
     * 新增评论
     *
     * @param comment 评论
     */
    void saveByComment(Comment comment);

    /**
     * 更改评论状态
     *
     * @param commentId 评论编号
     * @param status    状态
     * @return {@link Comment}
     */
    Comment updateCommentStatus(Long commentId, Integer status);

    /**
     * 根据评论编号查询评论
     *
     * @param commentId 评论编号
     * @return {@link Optional}<{@link Comment}>
     */
    Optional<Comment> findCommentById(Long commentId);

    /**
     * 删除评论
     *
     * @param commentId 评论编号
     * @return {@link Optional}<{@link Comment}>
     */
    Optional<Comment> removeByCommentId(Long commentId);

    /**
     * 根据文章和评论状态查询评论
     *
     * @param post     文章
     * @param pageable 分页
     * @param status   状态
     * @return {@link Page}<{@link Comment}>
     */
    Page<Comment> findCommentsByPostAndCommentStatus(Post post, Pageable pageable, Integer status);
}
