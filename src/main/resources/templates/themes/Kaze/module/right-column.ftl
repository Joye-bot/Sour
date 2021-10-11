<!-- right-column -->
<aside class="right-column">
    <div class="sticky-widescreen">
        <article class="card card-content">
            <div class="recent-posts-card">
                <div class="recent-posts-header">
                    <i class="iconfont icon-wenzhang_huaban" style="padding-right:2px"></i>Recent Posts
                </div>
                <div class="recent-posts-list">
                    <@articleTag method="archivesLess">
                        <#list archivesLess as archive>
                            <#list archive.posts?sort_by("postDate")?reverse as post>
                                <div class="recent-posts-item">
                                    <div class="recent-posts-item-title">${post.postDate?string("yyyy-MM-dd")}</div>
                                    <a href="/archives/${post.postUrl}">
                                        <div class="recent-posts-item-content">${post.postTitle}</div>
                                    </a>
                                </div>
                            </#list>
                        </#list>
                    </@articleTag>
                </div>
            </div>
        </article>
        <article class="card card-content">
            <div class="archive-card">
                <div class="archive-card-header">
                    <i class="iconfont icon-wodebaobiao" style="padding-right:2px"></i>Archive
                </div>
                <div class="archive-card-list">
                    <a href="/archives/2020" class="archive-card-list-item">2020
                        <span class="archive-card-list-item-badge">4</span>
                    </a>
                </div>
            </div>
        </article>
    </div>
</aside>