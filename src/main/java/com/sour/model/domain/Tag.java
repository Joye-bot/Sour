package com.sour.model.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 标签
 *
 * @author nndmw
 * @date 2021/09/04
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_tag")
public class Tag implements Serializable {

    private static final long serialVersionUID = -5096559823141853227L;

    /**
     * 标签编号
     */
    @Id
    @GeneratedValue
    private Long tagId;

    /**
     * 标签名称
     */
    private String tagName;

    /**
     * 标签路径
     */
    private String tagUrl;

    /**
     * 多个标签对应多个文章，多对多
     */
    @ManyToMany(mappedBy = "tags")
    @JsonIgnore
    @ToString.Exclude
    private List<Post> posts = new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Tag tag = (Tag) o;
        return Objects.equals(tagId, tag.tagId) &&
                Objects.equals(tagName, tag.tagName) &&
                Objects.equals(tagUrl, tag.tagUrl) &&
                Objects.equals(posts, tag.posts);
    }

    @Override
    public int hashCode() {
        return Objects.hash(tagId, tagName, tagUrl, posts);
    }
}
