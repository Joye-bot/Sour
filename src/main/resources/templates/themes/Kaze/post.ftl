<#include "module/macro.ftl">
<@head title="${options.blog_title!'Kaze'}"></@head>

<link href="/Kaze/source/js/lib/lightbox/baguetteBox.min.css" rel="stylesheet">

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
                    <div class="image-wrapper">
                        <img class="lozad image" src="https://img.songhn.com/img/gallery-webp.webp?imageslim"
                             alt="主题使用文档 thumbnail"
                             data-src="https://img.songhn.com/img/gallery-webp.webp?imageslim"
                             srcset="https://img.songhn.com/img/gallery-webp.webp?imageMogr2/blur/1x0/quality/1">
                    </div>
                    <!-- card -->
                    <article class="card card-content">
                        <header>
                            <h1 class="post-title">${post.postTitle}</h1>
                        </header>
                        <div class="post-meta post-show-meta">
                            <time datetime="2020-08-03T21:41:42.000Z">
                                <i class="iconfont icon-calendar" style="margin-right:2px"></i>
                                <span>2020-08-03</span>
                            </time>
                            <span class="dot"></span>
                            <a href="/categories/%E6%96%87%E6%A1%A3/" class="post-meta-link">文档 </a>
                            <span class="dot"></span>
                            <span>1.8k 字</span>
                        </div>

                        <!-- post-content -->
                        <div class="post-content" id="section">
                            ${post.postContent}
                        </div>
                        <!-- /.post-content -->

                        <div>
                            <div class="post-note note-warning copyright" style="margin-top:42px">
                                <p>
                                    <span style="font-weight:700">作者：</span>
                                    <a href="/about" rel="nofollow noopener noreferrer"
                                       target="_blank"> theme-kaze</a>
                                </p>
                                <p>
                                    <span style="font-weight:700">文章链接：</span>
                                    <a href="https://demo.theme-kaze.top/document/" rel="nofollow noopener noreferrer"
                                       target="_blank"> https://demo.theme-kaze.top/document/</a>
                                </p>
                                <p>
                                    <span style="font-weight:700">版权声明：</span>本博客所有文章除特别声明外，均采用
                                    <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh" rel="noopener"
                                       target="_blank">CC BY-NC-SA 4.0 协议</a>。转载请注明出处！
                                </p>
                            </div>
                        </div>
                    </article>
                    <!-- /.card -->

                    <div class="nav">
                        <div class="nav-item-next">
                            <a href="/highlight/" class="nav-link">
                                <div>
                                    <div class="nav-label">下一篇</div>
                                    <div class="nav-title">代码高亮</div>
                                </div>
                                <i class="iconfont icon-right nav-next-icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card card-content comment-card" style="margin-top:16px">
                        <div class="comment-card-title">评论</div>
                        <div id="vcomments"></div>
                        <script>
                            loadScript("https://unpkg.com/valine/dist/Valine.min.js");
                            var oldLoadVa = window.onload;
                            window.onload = function () {
                                oldLoadVa && oldLoadVa(), new Valine({
                                    el: "#vcomments",
                                    appId: "KxoK4Ebe5ijWF46B3vEOweiw-MdYXbMMI",
                                    appKey: "CTkC6yslbM9aItMbEqdhJd3d",
                                    placeholder: "欢迎评论",
                                    path: window.location.pathname,
                                    avatar: "mp",
                                    meta: ["nick", "mail", "link"],
                                    pageSize: "10",
                                    lang: "",
                                    visitor: "false",
                                    highlight: !0,
                                    recordIP: !1,
                                    serverURLs: "https://kxok4ebe.api.lncldglobal.com",
                                    enableQQ: "false",
                                    requiredFields: []
                                })
                            }
                        </script>
                    </div>
                    <div class="card card-content toc-card" id="mobiletoc">
                        <div class="toc-header">
                            <i class="iconfont icon-menu" style="padding-right:2px"></i>目录
                        </div>
                        <ol class="toc">
                            <li class="toc-item toc-level-2">
                                <a href="#%E4%B8%BB%E9%A2%98%E7%AE%80%E4%BB%8B" class="toc-link">
                                    <span class="toc-text">主题简介</span>
                                </a>
                            </li>
                            <li class="toc-item toc-level-2">
                                <a href="#%E4%BD%BF%E7%94%A8%E9%A1%BB%E7%9F%A5" class="toc-link">
                                    <span class="toc-text">使用须知</span>
                                </a>
                            </li>
                            <li class="toc-item toc-level-2">
                                <a href="#%E5%AE%89%E8%A3%85%E4%B8%BB%E9%A2%98"
                                   class="toc-link">
                                    <span class="toc-text">安装主题</span>
                                </a>
                                <ol class="toc-child">
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E7%9B%B4%E6%8E%A5%E9%80%9A%E8%BF%87npmyarn%E5%AE%89%E8%A3%85"
                                           class="toc-link">
                                            <span class="toc-text">直接通过npm&#x2F;yarn安装</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%85%B6%E4%BB%96%E6%96%B9%E5%BC%8F" class="toc-link">
                                            <span class="toc-text">其他方式</span>
                                        </a>
                                    </li>
                                </ol>
                            </li>
                            <li class="toc-item toc-level-2">
                                <a href="#%E6%8C%81%E7%BB%AD%E5%8D%87%E7%BA%A7" class="toc-link">
                                    <span class="toc-text">持续升级</span>
                                </a>
                            </li>
                            <li class="toc-item toc-level-2">
                                <a href="#%E6%80%BB%E4%BD%93" class="toc-link">
                                    <span class="toc-text">总体</span>
                                </a>
                                <ol class="toc-child">
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%A4%9A%E8%AF%AD%E8%A8%80" class="toc-link">
                                            <span class="toc-text">多语言</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E6%87%92%E5%8A%A0%E8%BD%BD" class="toc-link">
                                            <span class="toc-text">懒加载</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E6%96%87%E4%BB%B6%E5%8E%8B%E7%BC%A9" class="toc-link">
                                            <span class="toc-text">文件压缩</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E4%B8%BB%E9%A2%98%E9%A2%9C%E8%89%B2" class="toc-link">
                                            <span class="toc-text">主题颜色</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%AD%97%E5%8F%B7%E4%B8%8E%E5%AD%97%E4%BD%93" class="toc-link">
                                            <span class="toc-text">字号与字体</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#og-meta-%E5%85%83%E7%B4%A0" class="toc-link">
                                            <span class="toc-text">og meta 元素</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E9%9D%99%E6%80%81%E8%B5%84%E6%BA%90" class="toc-link"><span
                                                    class="toc-text">静态资源</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%8A%A8%E7%94%BB" class="toc-link">
                                            <span class="toc-text">动画</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%9B%BE%E6%A0%87" class="toc-link">
                                            <span class="toc-text">图标</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E7%AB%99%E7%82%B9%E8%AE%BF%E9%97%AE%E9%87%8F%E7%BB%9F%E8%AE%A1"
                                           class="toc-link">
                                            <span class="toc-text">站点访问量统计</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E6%95%B0%E6%8D%AE%E5%88%86%E6%9E%90" class="toc-link">
                                            <span class="toc-text">数据分析</span>
                                        </a>
                                    </li>
                                </ol>
                            </li>
                            <li class="toc-item toc-level-2">
                                <a href="#%E9%A6%96%E9%A1%B5" class="toc-link">
                                    <span class="toc-text">首页</span>
                                </a>
                                <ol class="toc-child">
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E6%96%87%E7%AB%A0%E5%A4%B4%E5%9B%BE" class="toc-link">
                                            <span class="toc-text">文章头图</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%B0%8F%E7%BB%84%E4%BB%B6" class="toc-link">
                                            <span class="toc-text">小组件</span>
                                        </a>
                                    </li>
                                </ol>
                            </li>
                            <li class="toc-item toc-level-2">
                                <a href="#%E5%85%B3%E4%BA%8E" class="toc-link">
                                    <span class="toc-text">关于</span>
                                </a>
                                <ol class="toc-child">
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E7%A4%BE%E4%BA%A4%E9%93%BE%E6%8E%A5" class="toc-link">
                                            <span class="toc-text">社交链接</span>
                                        </a>
                                    </li>
                                </ol>
                            </li>
                            <li class="toc-item toc-level-2">
                                <a href="#%E5%8F%8B%E9%93%BE" class="toc-link">
                                    <span class="toc-text">友链</span>
                                </a>
                            </li>
                            <li class="toc-item toc-level-2">
                                <a href="#%E6%96%87%E7%AB%A0%E9%A1%B5" class="toc-link">
                                    <span class="toc-text">文章页</span>
                                </a>
                                <ol class="toc-child">
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E6%90%9C%E7%B4%A2%E5%8A%9F%E8%83%BD" class="toc-link">
                                            <span class="toc-text">搜索功能</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E7%9B%AE%E5%BD%95" class="toc-link">
                                            <span class="toc-text">目录</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E4%BB%A3%E7%A0%81%E9%AB%98%E4%BA%AE" class="toc-link">
                                            <span class="toc-text">代码高亮</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F" class="toc-link">
                                            <span class="toc-text">数学公式</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#copyright" class="toc-link">
                                            <span class="toc-text">copyright</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#front-matter" class="toc-link">
                                            <span class="toc-text">Front-matter</span>
                                        </a>
                                        <ol class="toc-child">
                                            <li class="toc-item toc-level-4">
                                                <a href="#banner_img" class="toc-link">
                                                    <span class="toc-text">banner_img</span>
                                                </a>
                                            </li>
                                            <li class="toc-item toc-level-4">
                                                <a href="#banner_img_set" class="toc-link">
                                                    <span class="toc-text">banner_img_set</span>
                                                </a>
                                            </li>
                                            <li class="toc-item toc-level-4">
                                                <a href="#excerpt" class="toc-link">
                                                    <span class="toc-text">excerpt</span>
                                                </a>
                                            </li>
                                        </ol>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E8%AF%84%E8%AE%BA" class="toc-link">
                                            <span class="toc-text">评论</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%AD%97%E6%95%B0%E7%BB%9F%E8%AE%A1" class="toc-link">
                                            <span class="toc-text">字数统计</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%9B%BE%E7%89%87%E7%94%BB%E5%BB%8A" class="toc-link">
                                            <span class="toc-text">图片画廊</span>
                                        </a>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E6%A0%87%E7%AD%BE%E6%8F%92%E4%BB%B6" class="toc-link">
                                            <span class="toc-text">标签插件</span>
                                        </a>
                                        <ol class="toc-child">
                                            <li class="toc-item toc-level-4">
                                                <a href="#note" class="toc-link">
                                                    <span class="toc-text">note</span>
                                                </a>
                                            </li>
                                        </ol>
                                    </li>
                                    <li class="toc-item toc-level-3">
                                        <a href="#%E5%A4%87%E6%A1%88%E4%BF%A1%E6%81%AF" class="toc-link">
                                            <span class="toc-text">备案信息</span>
                                        </a>
                                    </li>
                                </ol>
                            </li>
                        </ol>
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
<a class="basebutton" id="menubutton"
   aria-label="menu button" role="button">
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
<link href="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" rel="stylesheet">
<script>
    var addImgLayout = function () {
        for (var t = document.querySelectorAll(".post-content img"), e = 0; e < t.length; e++) {
            var a = document.createElement("a");
            a.setAttribute("href", t[e].getAttribute("data-src")), a.setAttribute("aria-label", "illustration"), a.style.cssText = "width: 100%; display: flex; justify-content: center;", t[e].alt && (a.dataset.caption = t[e].alt), a.dataset.nolink = !0, t[e].before(a), a.append(t[e]);
            var r = document.createElement("div");
            r.classList.add("gallery"), a.before(r), r.append(a)
        }
        baguetteBox.run(".gallery")
    }
</script>
<script>loadScript("./js/lib/lightbox/baguetteBox.min.js", addImgLayout)</script>
