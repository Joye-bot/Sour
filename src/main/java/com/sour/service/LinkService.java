package com.sour.service;

import com.sour.model.domain.Link;

import java.util.List;
import java.util.Optional;

/**
 * 友情链接业务层
 *
 * @author nndmw
 * @date 2021/09/22
 */
public interface LinkService {

    /**
     * 查询所有的友情链接
     *
     * @return {@link List}<{@link Link}>
     */
    List<Link> findAllLinks();

    /**
     * 新增/修改友情链接
     *
     * @param link 链接
     * @return {@link Link}
     */
    Link saveByLink(Link link);

    /**
     * 根据编号查询单个链接
     *
     * @param linkId 友链编号
     * @return {@link Optional}<{@link Link}>
     */
    Optional<Link> findByLinkId(Long linkId);

    /**
     * 根据编号删除友情链接
     *
     * @param linkId 友链编号
     * @return {@link Link}
     */
    Link removeByLinkId(Long linkId);
}
