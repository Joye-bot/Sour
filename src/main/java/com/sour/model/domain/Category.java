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
 * 分类实体类
 *
 * @author nndmw
 * @date 2021/09/05
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_category")
public class Category implements Serializable {

    private static final long serialVersionUID = -3153280959055786338L;

    /**
     * 分类编号
     */
    @Id
    @GeneratedValue
    private Long cateId;

    /**
     * 分类名称
     */
    private String cateName;

    /**
     * 分类路径
     */
    private String cateUrl;

    /**
     * 分类描述
     */
    private String cateDesc;

    /**
     * 多个分类对应多个文章，多对多
     */
    @ManyToMany(mappedBy = "categories")
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
        Category category = (Category) o;
        return Objects.equals(cateId, category.cateId) &&
                Objects.equals(cateName, category.cateName) &&
                Objects.equals(cateUrl, category.cateUrl) &&
                Objects.equals(cateDesc, category.cateDesc) &&
                Objects.equals(posts, category.posts);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cateId, cateName, cateUrl, cateDesc, posts);
    }
}
