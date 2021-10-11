<!-- left-column -->
<aside class="left-column">
    <div class="card card-author">
        <img alt="author avatar" class="author-img" src="/Kaze/Kaze.png" height="88" width="88">
        <p class="author-name">theme-kaze</p>
        <p class="author-description">designed by theme-kaze</p>
        <div class="author-message">
            <a href="/archives" class="author-posts-count">
                <span>${postCount!0}</span>
                <span>Posts</span>
            </a>
            <a href="/categories" class="author-categories-count">
                <span>${categoryCount!0}</span>
                <span>Categories</span>
            </a>
            <a href="/tags" class="author-tags-count">
                <span>${tagCount!0}</span>
                <span>Tags</span>
            </a>
        </div>

        <div class="author-card-society">
            <div class="author-card-society-icon">
                <a href="https://github.com/theme-kaze/hexo-theme-Kaze" rel="noopener" target="_blank">
                    <i class="iconfont society-icon icon-github"></i>
                </a>
            </div>
            <div class="author-card-society-icon">
                <a href="mailto:i@songhn.com">
                    <i class="iconfont society-icon icon-mail"></i>
                </a>
            </div>
            <div class="author-card-society-icon">
                <a href="https://www.google.cn/chrome/" rel="noopener" target="_blank">
                    <i class="iconfont society-icon icon-chrome"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="sticky-tablet">
        <article class="card card-content categories-widget">
            <div class="categories-card">
                <div class="categories-header">
                    <i class="iconfont icon-fenlei" style="padding-right:2px"></i>Categories
                </div>
                <div class="categories-list">
                    <@commonTag method="categories">
                        <#list categories as cate>
                            <a href="#">
                                <div class="categories-list-item">${cate.cateName}
                                    <span class="categories-list-item-badge">3</span>
                                </div>
                            </a>
                        </#list>
                    </@commonTag>
                </div>
            </div>
        </article>
        <article class="card card-content tags-widget">
            <div class="tags-card">
                <div class="tags-header">
                    <i class="iconfont icon-biaoqian" style="padding-right:2px"></i>hot tags
                </div>
                <div class="tags-list">
                    <#list tags as tag>
                        <a href="#" title="${tag.tagName}">
                            <div class="tags-list-item">${tag.tagName}</div>
                        </a>
                    </#list>
                </div>
            </div>
        </article>
        <article class="card card-content archive-widget widescreen-archive">
            <div class="archive-card">
                <div class="archive-card-header">
                    <i class="iconfont icon-wodebaobiao" style="padding-right:2px"></i>归档
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