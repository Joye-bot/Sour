<#include "module/macro.ftl">
<@head title="${options.blog_title!'Anatole'}"></@head>

<link rel="stylesheet" href="/Anatole/source/plugins/prism/prism.css">
<style>
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
                    <#include "module/comment.ftl">
                </div>
            </div>
        </div>
    </div>
</div>

