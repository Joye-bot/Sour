package com.sour.model.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Objects;

/**
 * 友情链接实体类
 *
 * @author nndmw
 * @date 2021/09/04
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_link")
public class Link implements Serializable {

    private static final long serialVersionUID = 4174650892447432476L;

    /**
     * 友情链接编号
     */
    @Id
    @GeneratedValue
    private Long linkId;

    /**
     * 友情链接名称
     */
    private String linkName;

    /**
     * 友情链接地址
     */
    private String linkUrl;

    /**
     * 友情链接头像
     */
    private String linkPic;

    /**
     * 友情链接描述
     */
    private String linkDesc;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Link link = (Link) o;
        return Objects.equals(linkId, link.linkId) &&
                Objects.equals(linkName, link.linkName) &&
                Objects.equals(linkUrl, link.linkUrl) &&
                Objects.equals(linkPic, link.linkPic) &&
                Objects.equals(linkDesc, link.linkDesc);
    }

    @Override
    public int hashCode() {
        return Objects.hash(linkId, linkName, linkUrl, linkPic, linkDesc);
    }
}
