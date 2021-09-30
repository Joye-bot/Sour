package com.sour.service.impl;

import com.sour.model.domain.Post;
import com.sour.model.domain.Tag;
import com.sour.repository.PostRepository;
import com.sour.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文章业务层实现类
 *
 * @author nndmw
 * @date 2021/09/08
 */
@Service
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;

    @Autowired
    public PostServiceImpl(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    /**
     * 根据文章状态查询 分页
     *
     * @param status   状态
     * @param postType 文章类型
     * @param pageable 可分页
     * @return {@link Page}<{@link Post}>
     */
    @Override
    public Page<Post> findPostByStatus(Integer status, String postType, Pageable pageable) {
        return postRepository.findPostsByPostStatusAndPostType(status, postType, pageable);
    }

    /**
     * 获取文章列表 分页
     *
     * @param postType post or page
     * @param pageable 分页信息
     * @return {@link Page}<{@link Post}>
     */
    @Override
    public Page<Post> findAllPosts(String postType, Pageable pageable) {
        return postRepository.findPostsByPostType(postType, pageable);
    }

    /**
     * 获取文章列表 不分页
     *
     * @param postType post or page
     * @return {@link List}<{@link Post}>
     */
    @Override
    public List<Post> findAllPosts(String postType) {
        return postRepository.findPostsByPostType(postType);
    }

    /**
     * 新增/保存文章
     *
     * @param post 文章
     * @return {@link Post}
     */
    @Override
    public Post saveByPost(Post post) {
        return postRepository.save(post);
    }

    /**
     * 根据标签查询文章
     *
     * @param tag      标签
     * @param pageable 可分页
     * @return {@link Page}<{@link Post}>
     */
    @Override
    public Page<Post> findPostsByTags(Tag tag, Pageable pageable) {
        return postRepository.findPostsByTags(tag, pageable);
    }
}
