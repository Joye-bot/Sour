<#include "module/macro.ftl">
<@head title="${options.blog_title!'Kaze'}"></@head>

<div class="wrapper">

    <#include "module/navbar.ftl">

    <div id="local-search" style="display:none">
        <input class="navbar-menu-item" id="search-input" placeholder="请输入搜索内容...">
        <div id="search-content"></div>
    </div>

    <div class="section-wrap">
        <div class="container">
            <div class="columns">
                <main class="main-column">

                    <#list posts.content as post>
                        <!-- card -->
                        <div class="card">
                            <a href="/archives/${post.postUrl}" class="image-wrapper" aria-label="thumbnail">
                                <img alt="banner" class="image lozad"
                                     src="https://img.songhn.com/img/gallery-webp.webp?imageslim"
                                     data-src="https://img.songhn.com/img/gallery-webp.webp?imageslim"
                                     srcset="https://img.songhn.com/img/gallery-webp.webp?imageMogr2/blur/1x0/quality/1">
                            </a>
                            <article class="card card-content">
                                <a href="/archives/${post.postUrl}">
                                    <h1 class="post-title">${post.postTitle}</h1>
                                </a>
                                <div class="card-excerpt">${post.postSummary!}</div>
                                <div class="card-post-footer">
                                    <div class="post-meta">
                                        <time datetime="2020-08-03T21:41:42.000Z">
                                            <i class="iconfont icon-calendar" style="margin-right:2px"></i>
                                            <span>2020-08-03</span>
                                        </time>

                                        <#if post.tags?size gt 0>
                                            <span class="dot"></span>
                                            <#list post.tags as tag>
                                                <a href="#" class="post-meta-link">${tag.tagName}</a>
                                            </#list>
                                        </#if>
                                    </div>
                                    <a href="#">Read More</a>
                                </div>
                            </article>
                        </div>
                        <!-- /.card -->
                    </#list>

                </main>

                <#include "module/left-column.ftl">

                <#include "module/right-column.ftl">
            </div>
        </div>
    </div>
</div>

<#include "module/footer.ftl">

<a class="basebutton" aria-label="回到顶部" id="scrollbutton" role="button">
    <i class="iconfont button-icon icon-arrowleft"></i>
</a>
<a class="basebutton" aria-label="menu button" id="menubutton" role="button">
    <i class="iconfont button-icon icon-menu"></i>
</a>
<a class="basebutton" aria-label="控制中心" id="popbutton" role="button">
    <i class="iconfont button-icon icon-expand"></i>
</a>
<a class="basebutton darkwidget" aria-label="夜色模式" id="darkbutton" role="button">
    <i class="iconfont button-icon icon-weather"></i>
</a>
<a class="basebutton searchwidget" aria-label="搜索" id="searchbutton" role="button">
    <i class="iconfont button-icon icon-search"></i>
</a>
