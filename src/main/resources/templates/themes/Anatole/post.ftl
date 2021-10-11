<#include "module/macro.ftl">
<@head title="${options.blog_title!'Anatole'}"></@head>

<link rel="stylesheet" href="/Anatole/source/plugins/prism/prism.css">
<style>
    .native-comment {
        padding: 10px;
    }

    .native-wrap {
        border: 1px solid #f0f0f0;
        padding: 10px;
        overflow: hidden;
        position: relative;
    }

    .comment-header {
        width: 100%;
        line-height: 1.8;
    }

    .comment-input-who, .comment-input-email, .comment-input-website {
        width: 33.33%;
        padding: 10px 0;
        font-size: .8rem;
        float: left;
        border: none;
        border-bottom: 1px dashed #dedede;
    }

    .comment-input:focus {
        border-bottom: 1px dashed red;
    }

    .comment-input-content {
        width: 100%;
        min-height: 120px;
        resize: vertical;
        border: none;
        padding: 10px 0;
    }

    .comment-footer {
        text-align: right;
        vertical-align: middle;
    }

    .comment-submit {
        border-radius: 0;
        vertical-align: middle;
        padding: 7px 14px;
        font-size: .9rem;
        cursor: pointer;
        border: 1px solid #ededed;
        background: #ededed;
        color: #313131;
    }

    code, tt {
        font-size: 1.2em;
    }
</style>

<!--sidebar-->
<#include "module/sidebar.ftl">

<div class="main">

    <!-- page-top -->
    <#include "module/page-top.ftl">

    <div class="autopagerize_page_element">
        <div class="content">
            <div>
                <div class="post animated fadeInDown">
                    <div class="post-title">
                        <h3>
                            <a>${post.postTitle}</a>
                        </h3>
                    </div>
                    <div class="post-content">
                        ${post.postContent}
                    </div>
                    <div class="post-footer">
                        <div class="meta">
                            <div class="info">
                                <i class="fa fa-sun-o"></i>
                                <span class="date">${post.postDate?string("yyyy-MM-dd")}</span>
                                <i class="fa fa-comment-o"></i>
                                <a href="/archives/${post.postUrl}">评论</a>
                                <#if post.tags?size gt 0>
                                    <i class="fa fa-tag"></i>
                                    <#list post.tags as tag>
                                        <a href="/tags/${tag.tagUrl}" class="tag">${tag.tagName}</a>
                                    </#list>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="share">
                    <div class="evernote">
                        <a href="https://evernote.com/" ref="nofollow" target="_blank" class="fa fa-bookmark"></a>
                    </div>
                    <div class="weibo">
                        <a href="https://evernote.com/" class="fa fa-weibo"></a>
                    </div>
                    <div class="twitter">
                        <a href="#" class="fa fa-twitter"></a>
                    </div>
                </div>

                <div class="pagination">
                    <ul>
                        <li class="pre">
                            <a class="btn" role="navigation" href="#" title="">上一篇</a>
                        </li>
                    </ul>
                </div>

                <div id="comment_widget">
                    <div class="native-comment">
                        <div class="native-wrap">
                            <div class="comment-header">
                                <input type="hidden" name="postId" value="">
                                <input type="text" class="comment-input comment-input-who" id="commentAuthor"
                                       name="commentAuthor" placeholder="昵称">
                                <input type="text" class="comment-input comment-input-email" name="commentAuthorEmail"
                                       placeholder="邮箱">
                                <input type="text" class="comment-input comment-input-website"
                                       name="commentAuthorUrl" placeholder="网址(https/http)">
                            </div>
                            <div class="comment-content">
                                <textarea class="comment-input comment-input-content" id="commentContent"
                                          name="commentContent" placeholder="come on"></textarea>
                            </div>
                            <div class="comment-footer">
                                <button type="button" class="comment-submit" id="btn-push">提交</button>
                            </div>
                        </div>
                        <div class="native-info" style="padding-top: 5px; font-size: 12px; color: #0F192A;">
                            <span id="native-info-total">13</span>条评论
                        </div>
                        <ul class="native-list">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="//cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.min.js"></script>
<script src="//cdn.bootcss.com/UAParser.js/0.7.17/ua-parser.min.js"></script>
