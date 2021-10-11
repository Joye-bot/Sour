package com.sour.service.impl;

import com.sour.model.domain.Category;
import com.sour.model.domain.Post;
import com.sour.model.domain.Tag;
import com.sour.model.dto.Archive;
import com.sour.model.dto.SourConst;
import com.sour.repository.PostRepository;
import com.sour.service.PostService;
import com.sour.util.SourUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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

    /**
     * 根据文章编号查询文章
     *
     * @param postId 文章编号
     * @return {@link Optional}<{@link Post}>
     */
    @Override
    public Optional<Post> findByPostId(Long postId) {
        return postRepository.findById(postId);
    }


    /**
     * 修改文章状态
     *
     * @param postId 文章编号
     * @param status 状态
     * @return {@link Post}
     */
    @Override
    public Post updatePostStatus(Long postId, Integer status) {
        final Optional<Post> post = this.findByPostId(postId);
        if (post.isPresent()) {
            post.get().setPostStatus(status);
            return postRepository.save(post.get());
        }
        return null;
    }

    /**
     * 根据编号删除文章
     *
     * @param postId 文章编号
     * @return {@link Post}
     */
    @Override
    public Post removeByPostId(Long postId) {
        final Optional<Post> post = this.findByPostId(postId);
        if (post.isPresent()) {
            postRepository.delete(post.get());
            return post.get();
        }
        return null;
    }

    /**
     * 根据文章路径查询
     *
     * @param postUrl  文章路径
     * @param postType 文章类型 post or page
     * @return {@link Post}
     */
    @Override
    public Post findByPostUrl(String postUrl, String postType) {
        return postRepository.findPostByPostUrlAndPostType(postUrl, postType);
    }

    /**
     * 查询当前文章日期之前的所有文章
     *
     * @param postDate 发布日期
     * @return {@link List}<{@link Post}>
     */
    @Override
    public List<Post> findByPostDateBefore(Date postDate) {
        return postRepository.findByPostDateBeforeAndPostStatusAndPostTypeOrderByPostDateAsc(postDate, 0, SourConst.POST_TYPE_POST);
    }

    /**
     * 查询当前文章日期之后的所有文章
     *
     * @param postDate 发布日期
     * @return {@link List}<{@link Post}>
     */
    @Override
    public List<Post> findByPostDateAfter(Date postDate) {
        return postRepository.findByPostDateAfterAndPostStatusAndPostTypeOrderByPostDateDesc(postDate, 0, SourConst.POST_TYPE_POST);
    }

    /**
     * 根据年份查询文章
     *
     * @param year 年份
     * @return {@link List}<{@link Post}>
     */
    @Override
    public List<Post> findPostByYear(String year) {
        return postRepository.findPostByYear(year);
    }


    /**
     * 查询归档信息 根据年份
     *
     * @return {@link List}<{@link Archive}>
     */
    @Override
    public List<Archive> findPostGroupByYear() {
        final List<Object[]> objects = postRepository.findPostGroupByYear();
        final List<Archive> archives = new ArrayList<>();
        Archive archive;
        for (Object[] obj : objects) {
            archive = new Archive();
            archive.setYear(obj[0].toString());
            archive.setCount(obj[1].toString());
            archive.setPosts(this.findPostByYear(obj[0].toString()));
            archives.add(archive);
        }
        return archives;
    }

    /**
     * 批量修改文章摘要
     *
     * @param postSummary 文章摘要
     */
    @Override
    public void updateAllSummary(Integer postSummary) {
        List<Post> posts = this.findAllPosts(SourConst.POST_TYPE_POST);
        for (Post post : posts) {
            if (SourUtil.htmlToText(post.getPostContent()).length() >= postSummary) {
                post.setPostSummary(SourUtil.getSummary(post.getPostContent(), postSummary));
                postRepository.save(post);
            }
        }
    }

    /**
     * 根据分类查询文章
     *
     * @param category 分类
     * @param pageable 可分页
     * @return {@link Page}<{@link Post}>
     */
    @Override
    public Page<Post> findPostsByCategories(Category category, Pageable pageable) {
        return postRepository.findPostsByCategories(category, pageable);
    }
}
