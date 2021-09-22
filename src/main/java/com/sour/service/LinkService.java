package com.sour.service;

import com.sour.model.domain.Link;

import java.util.List;

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
}
