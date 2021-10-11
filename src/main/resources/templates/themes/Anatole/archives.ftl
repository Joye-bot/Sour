<#include "module/macro.ftl">
<@head title="${options.blog_title!'Anatole'}"></@head>

<!--sidebar-->
<#include "module/sidebar.ftl">

<div class="main">

    <!-- page-top -->
    <#include "module/page-top.ftl">

    <div class="autopagerize_page_element">
        <div class="content">
            <div class="post animated fadeInDown">
                <ul class="list-with-title">
                    <@articleTag method="archivesLess">
                        <#list archivesLess as archive>
                            <div class="listing-title">${archive.year}</div>
                            <ul class="listing">
                                <#list archive.posts?sort_by("postDate")?reverse as post>
                                    <div class="listing-item">
                                        <div class="listing-post">
                                            <a href="/archives/${post.postUrl}"
                                               target="${post.postTitle}">${post.postTitle}</a>
                                            <div class="post-time">
                                                <span class="date">${post.postDate?string("yyyy-MM-dd")}</span>
                                            </div>
                                        </div>
                                    </div>
                                </#list>
                            </ul>
                        </#list>
                    </@articleTag>
                </ul>
            </div>
        </div>
    </div>
</div>

<@footer></@footer>