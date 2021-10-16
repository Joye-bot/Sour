package com.sour.repository;

import com.sour.model.domain.Comment;
import com.sour.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 评论持久层
 *
 * @author nndmw
 * @date 2021/10/13
 */
public interface CommentRepository extends JpaRepository<Comment, Long> {

    /**
     * 根据评论状态查询所有评论 分页
     *
     * @param status   文章状态
     * @param pageable 分页信息
     * @return {@link Page}<{@link Comment}>
     */
    Page<Comment> findCommentsByCommentStatus(Integer status, Pageable pageable);

    /**
     * 根据文章和评论状态查询评论
     *
     * @param post     文章
     * @param pageable 分页
     * @param status   状态
     * @return {@link Page}<{@link Comment}>
     */
    Page<Comment> findCommentsByPostAndCommentStatusNot(Post post, Pageable pageable, Integer status);
}
