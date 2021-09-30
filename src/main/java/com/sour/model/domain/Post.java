package com.sour.model.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 文章实体类
 *
 * @author nndmw
 * @date 2021/09/04
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_post")
public class Post implements Serializable {

    private static final long serialVersionUID = -5934998532434688705L;

    /**
     * 文章编号
     */
    @Id
    @GeneratedValue
    private Long postId;

    /**
     * 发表用户 多对一
     */
    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id")
    private User user;

    /**
     * 文章标题
     */
    private String postTitle;

    /**
     * 文章类型
     * post 文章
     * type 页面
     */
    private String postType = "post";

    /**
     * 文章内容 Markdown格式
     */
    @Lob
    private String postContentMd;

    /**
     * 文章内容 html格式
     */
    @Lob
    private String postContent;

    /**
     * 文章路径
     */
    @Column(unique = true)
    private String postUrl;

    /**
     * 文章摘要
     */
    private String postSummary;

    /**
     * 缩略图
     */
    private String postThumbnail;

    /**
     * 发表日期
     */
    private Date postDate;

    /**
     * 0 已发布
     * 1 草稿
     * 2 回收站
     */
    private Integer postStatus = 0;

    /**
     * 文章所属分类
     */
    @ManyToMany(cascade = {CascadeType.PERSIST}, fetch = FetchType.LAZY)
    @JoinTable(name = "sour_posts_categories",
            joinColumns = {@JoinColumn(name = "post_id", nullable = false)},
            inverseJoinColumns = {@JoinColumn(name = "cate_id", nullable = false)})
    @ToString.Exclude
    private List<Category> categories = new ArrayList<>();

    /**
     * 文章所属标签
     */
    @ManyToMany(cascade = {CascadeType.PERSIST}, fetch = FetchType.LAZY)
    @JoinTable(name = "sour_posts_tags",
            joinColumns = {@JoinColumn(name = "post_id", nullable = false)},
            inverseJoinColumns = {@JoinColumn(name = "tag_id", nullable = false)})
    @ToString.Exclude
    private List<Tag> tags = new ArrayList<>();

    /**
     * 文章的评论
     */
    @OneToMany(mappedBy = "post", cascade = {CascadeType.REMOVE}, fetch = FetchType.EAGER)
    @JsonIgnore
    private List<Comment> comments = new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Post post = (Post) o;
        return Objects.equals(postId, post.postId) &&
                Objects.equals(user, post.user) &&
                Objects.equals(postTitle, post.postTitle) &&
                Objects.equals(postType, post.postType) &&
                Objects.equals(postContentMd, post.postContentMd) &&
                Objects.equals(postContent, post.postContent) &&
                Objects.equals(postUrl, post.postUrl) &&
                Objects.equals(postSummary, post.postSummary) &&
                Objects.equals(postThumbnail, post.postThumbnail) &&
                Objects.equals(postDate, post.postDate) &&
                Objects.equals(postStatus, post.postStatus) &&
                Objects.equals(categories, post.categories) &&
                Objects.equals(tags, post.tags) &&
                Objects.equals(comments, post.comments);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                postId, user, postTitle, postType, postContentMd, postContent,
                postUrl, postSummary, postThumbnail, postDate, postStatus, categories, tags, comments
        );
    }
}
