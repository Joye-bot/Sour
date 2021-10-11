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
                    <div class="card card-content">
                        <div class="categories-page-title" style="margin-bottom:.6rem">Categories</div>
                        <div>Total&nbsp;${categoryCount!0}&nbsp;posts</div>
                    </div>
                    <div class="card card-content categories-page-card">
                        <@commonTag method="categories">
                            <#list categories as cate>
                                <a href="#" class="categories-page-list-item"
                                   style="margin-top:0">
                                    <span>${cate.cateName}</span>
                                    <span class="categories-page-list-item-total">Total&nbsp;3&nbsp;posts </span>
                                </a>
                            </#list>
                        </@commonTag>
                    </div>
                </main>

                <#include "module/left-column.ftl">

                <#include "module/right-column.ftl">
            </div>
        </div>
    </div>
</div>

<#include "module/footer.ftl">

<a class="basebutton" id="scrollbutton" aria-label="回到顶部" role="button">
    <i class="iconfont button-icon icon-arrowleft"></i>
</a>
<a class="basebutton" id="menubutton" aria-label="menu button" role="button">
    <i class="iconfont button-icon icon-menu"></i>
</a>
<a class="basebutton" id="popbutton" aria-label="控制中心" role="button">
    <i class="iconfont button-icon icon-expand"></i>
</a>
<a class="basebutton darkwidget" id="darkbutton" aria-label="夜色模式" role="button">
    <i class="iconfont button-icon icon-weather"></i>
</a>
<a class="basebutton searchwidget" id="searchbutton" aria-label="搜索" role="button">
    <i class="iconfont button-icon icon-search"></i>
</a>
