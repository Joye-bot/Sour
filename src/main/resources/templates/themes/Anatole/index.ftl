<#include "module/macro.ftl">
<@head title="${options.blog_title!'Anatole'}"></@head>

<!--sidebar-->
<#include "module/sidebar.ftl">


<div class="main">

    <!-- page-top -->
    <#include "module/page-top.ftl">

    <div class="autopagerize_page_element">
        <div class="content">
            <!-- post_entry -->
            <#include "module/post-entry.ftl">

            <#if posts.totalPages gt 1>
                <div class="pagination">
                    <ul>
                        <#if posts.hasPrevious()>
                            <#if posts.number == 1>
                                <li class="next">
                                    <a class="btn" role="navigation" href="/">上一页</a>
                                </li>
                            <#else >
                                <li class="next">
                                    <a class="btn" role="navigation" href="/page/${posts.number}">上一页</a>
                                </li>
                            </#if>
                        </#if>

                        <#if posts.hasNext()>
                            <li class="next">
                                <a class="btn" role="navigation" href="/page/${posts.number+2}">下一页</a>
                            </li>
                        </#if>
                    </ul>
                </div>
            </#if>
        </div>
    </div>
</div>

<@footer></@footer>