package com.sour.service.impl;

import com.sour.model.domain.Comment;
import com.sour.model.domain.Post;
import com.sour.repository.CommentRepository;
import com.sour.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * 评论业务逻辑层实现类
 *
 * @author nndmw
 * @date 2021/10/13
 */
@Service
public class CommentServiceImpl implements CommentService {

    private final CommentRepository commentRepository;

    @Autowired
    public CommentServiceImpl(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    /**
     * 查询所有的评论，用于后台管理
     *
     * @param status   状态
     * @param pageable 分页
     * @return {@link Page}<{@link Comment}>
     */
    @Override
    public Page<Comment> findAllComments(Integer status, Pageable pageable) {
        return commentRepository.findCommentsByCommentStatus(status, pageable);
    }

    /**
     * 新增评论
     *
     * @param comment 评论
     */
    @Override
    public void saveByComment(Comment comment) {
        commentRepository.save(comment);
    }

    /**
     * 更改评论状态
     *
     * @param commentId 评论编号
     * @param status    状态
     * @return {@link Comment}
     */
    @Override
    public Comment updateCommentStatus(Long commentId, Integer status) {
        Optional<Comment> comment = findCommentById(commentId);
        if (comment.isPresent()) {
            comment.get().setCommentStatus(status);
            return commentRepository.save(comment.get());
        }
        return null;
    }

    /**
     * 根据评论编号查询评论
     *
     * @param commentId 评论编号
     * @return {@link Optional}<{@link Comment}>
     */
    @Override
    public Optional<Comment> findCommentById(Long commentId) {
        return commentRepository.findById(commentId);
    }

    /**
     * 删除评论
     *
     * @param commentId 评论编号
     * @return {@link Optional}<{@link Comment}>
     */
    @Override
    public Optional<Comment> removeByCommentId(Long commentId) {
        Optional<Comment> comment = this.findCommentById(commentId);
        if (comment.isPresent()) {
            commentRepository.delete(comment.get());
            return comment;
        }
        return Optional.empty();
    }

    /**
     * 根据文章和评论状态查询评论
     *
     * @param post     文章
     * @param pageable 分页
     * @param status   状态
     * @return {@link Page}<{@link Comment}>
     */
    @Override
    public Page<Comment> findCommentsByPostAndCommentStatus(Post post, Pageable pageable, Integer status) {
        return commentRepository.findCommentsByPostAndCommentStatusNot(post, pageable, status);
    }
}
