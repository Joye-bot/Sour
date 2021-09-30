package com.sour.service.impl;

import com.sour.model.domain.Tag;
import com.sour.repository.TagRepository;
import com.sour.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * 标签业务层实现类
 *
 * @author nndmw
 * @date 2021/09/20
 */
@Service
public class TagServiceImpl implements TagService {

    private final TagRepository tagRepository;

    @Autowired
    public TagServiceImpl(TagRepository tagRepository) {
        this.tagRepository = tagRepository;
    }

    /**
     * 获取所有标签
     *
     * @return {@link List}<{@link Tag}>
     */
    @Override
    public List<Tag> findAllTags() {
        return tagRepository.findAll();
    }

    /**
     * 新增/修改标签
     *
     * @param tag 标签
     * @return {@link Tag}
     */
    @Override
    public Tag saveByTag(Tag tag) {
        return tagRepository.save(tag);
    }

    /**
     * 根据编号查询标签
     *
     * @param tagId 标签编号
     * @return {@link Optional}<{@link Tag}>
     */
    @Override
    public Optional<Tag> findByTagId(Long tagId) {
        return tagRepository.findById(tagId);
    }

    /**
     * 根据编号移除标签
     *
     * @param tagId 标签id
     * @return {@link Tag}
     */
    @Override
    public Tag removeByTagId(Long tagId) {
        final Optional<Tag> tag = findByTagId(tagId);
        if (tag.isPresent()) {
            tagRepository.delete(tag.get());
            return tag.get();
        }
        return null;
    }

    /**
     * 根据标签路径查询
     *
     * @param tagUrl 标签路径
     * @return {@link Tag}
     */
    @Override
    public Tag findByTagUrl(String tagUrl) {
        return tagRepository.findTagByTagUrl(tagUrl);
    }

    @Override
    public Tag findTagByTagName(String tagName) {
        return tagRepository.findTagByTagName(tagName);
    }

    /**
     * 转换标签字符串为实体集合
     *
     * @param tagList 标签列表
     * @return {@link List}<{@link Tag}>
     */
    @Override
    public List<Tag> strListToTagList(String tagList) {
        final String[] tags = tagList.split(",");
        final List<Tag> tagsList = new ArrayList<>();
        for (String tag : tags) {
            final Tag t = findTagByTagName(tag);
            Tag temp = null;
            if (t != null) {
                tagsList.add(t);
            } else {
                temp = new Tag();
                temp.setTagName(tag);
                temp.setTagUrl(tag);
                tagsList.add(saveByTag(temp));
            }
        }
        return tagsList;
    }
}
