package com.sour.model.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 评论实体类
 *
 * @author nndmw
 * @date 2021/09/05
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_comment")
public class Comment implements Serializable {

    private static final long serialVersionUID = -3727915239051418296L;

    /**
     * 评论id 自增
     */
    @Id
    @GeneratedValue
    private Long commentId;

    /**
     * 评论人
     */
    private String commentAuthor;

    /**
     * 评论人的邮箱
     */
    private String commentAuthorEmail;

    /**
     * 评论人的主页
     */
    private String commentAuthorUrl;

    /**
     * 评论人的ip
     */
    private String commentAuthorIp;

    /**
     * 评论人的头像，用于avatar
     */
    private String commentAuthorAvatarMd5;

    /**
     * 评论时间
     */
    private Date commentDate;

    /**
     * 评论内容
     */
    @Lob
    private String commentContent;

    /**
     * 评论者的信息
     */
    private String commentAgent;

    /**
     * 上一级
     */
    private Long commentParent = 0L;

    /**
     * 评论状态，0：正常，1：待审核，2：回收站
     */
    private Integer commentStatus = 1;

    /**
     * 是否是博主的评论，0：不是，1：是
     */
    private Integer isAdmin;

    /**
     * 评论文章
     */
    @ManyToOne(targetEntity = Post.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "post_id")
    private Post post;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Comment comment = (Comment) o;
        return Objects.equals(commentId, comment.commentId) &&
                Objects.equals(commentAuthor, comment.commentAuthor) &&
                Objects.equals(commentAuthorEmail, comment.commentAuthorEmail) &&
                Objects.equals(commentAuthorUrl, comment.commentAuthorUrl) &&
                Objects.equals(commentAuthorIp, comment.commentAuthorIp) &&
                Objects.equals(commentAuthorAvatarMd5, comment.commentAuthorAvatarMd5) &&
                Objects.equals(commentDate, comment.commentDate) &&
                Objects.equals(commentContent, comment.commentContent) &&
                Objects.equals(commentAgent, comment.commentAgent) &&
                Objects.equals(commentParent, comment.commentParent) &&
                Objects.equals(commentStatus, comment.commentStatus) &&
                Objects.equals(isAdmin, comment.isAdmin) &&
                Objects.equals(post, comment.post);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                commentId, commentAuthor, commentAuthorEmail, commentAuthorUrl,
                commentAuthorIp, commentAuthorAvatarMd5, commentDate, commentContent,
                commentAgent, commentParent, commentStatus, isAdmin, post
        );
    }
}
