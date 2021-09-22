package com.sour.service.impl;

import com.sour.model.domain.Link;
import com.sour.repository.LinkRepository;
import com.sour.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 友情链接业务层实现类
 *
 * @author nndmw
 * @date 2021/09/22
 */
@Service
public class LinkServiceImpl implements LinkService {

    private final LinkRepository linkRepository;

    @Autowired
    public LinkServiceImpl(LinkRepository linkRepository) {
        this.linkRepository = linkRepository;
    }

    /**
     * 查询所有的友情链接
     *
     * @return {@link List}<{@link Link}>
     */
    @Override
    public List<Link> findAllLinks() {
        return linkRepository.findAll();
    }
}
