package com.sour.service.impl;

import com.sour.model.domain.Link;
import com.sour.repository.LinkRepository;
import com.sour.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

    /**
     * 新增/修改友情链接
     *
     * @param link 链接
     * @return {@link Link}
     */
    @Override
    public Link saveByLink(Link link) {
        return linkRepository.save(link);
    }

    /**
     * 根据编号查询单个链接
     *
     * @param linkId 友链编号
     * @return {@link Optional}<{@link Link}>
     */
    @Override
    public Optional<Link> findByLinkId(Long linkId) {
        return linkRepository.findById(linkId);
    }

    /**
     * 根据编号删除友情链接
     *
     * @param linkId 友链编号
     * @return {@link Link}
     */
    @Override
    public Link removeByLinkId(Long linkId) {
        final Optional<Link> link = this.findByLinkId(linkId);
        if (link.isPresent()) {
            linkRepository.delete(link.get());
            return link.get();
        }
        return null;
    }
}
