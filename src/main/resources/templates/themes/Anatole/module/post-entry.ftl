<#list posts.content as post>
    <div class="post animated fadeInDown">
        <div class="post-title">
            <h3>
                <a href="/archives/${post.postUrl}">${post.postTitle}</a>
            </h3>
        </div>
        <div class="post-content">
            <p>${post.postSummary!}...</p>
        </div>
        <div class="post-footer">
            <div class="meta">
                <div class="info">
                    <i class="fa fa-sun-o"></i>
                    <span class="date">2021-06-10</span>
                    <i class="fa fa-comment-o"></i>
                    <a href="#">评论</a>
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
</#list>