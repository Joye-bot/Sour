<#macro head title="">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width,initial-scale=1,minimum-scale=1" name="viewport">
        <meta content="ie=edge" http-equiv="X-UA-Compatible">
        <meta content="#fff" name="theme-color" id="theme-color">
        <meta content="Hexo" name="description">
        <link href="/Kaze/Kaze.png" rel="icon">
        <title>${title!"Kaze"}</title>
        <meta content="theme-kaze demo" property="og:title">
        <meta content="https://demo.theme-kaze.top/index.html" property="og:url">
        <meta content="/Kaze/Kaze.png" property="og:img">
        <script>
            function loadScript(e, t) {
                var n = document.createElement("script");
                n.src = e, t && (n.onload = t), n.async = !0, document.body.appendChild(n)
            }

            function loadCSS(e, t, n) {
                var a = document.createElement("link");
                a.ref = "stylesheet", a.href = e, a.dataset[t] = n, document.head.appendChild(a)
            }

            function changeCSS(e, t, n) {
                var a = document.querySelector(t), t = document.createElement("link");
                t.setAttribute("rel", "stylesheet"), t.setAttribute("href", e), t.dataset.prism = n, document.head.replaceChild(t, a)
            }
        </script>
        <script>
            function prismThemeChange() {
                document.getElementById("theme-color").dataset.mode, document.querySelector("[data-prism]") ? changeCSS("/Kaze/source/js/lib/prism/prism-tomorrow.min.css", "[data-prism]", "prism-tomorrow") : loadCSS("/Kaze/source/js/lib/prism/prism-tomorrow.min.css", "prism", "prism-tomorrow")
            }

            prismThemeChange()
        </script>
        <link href="/Kaze/source/js/lib/prism/prism-line-numbers.min.css" rel="stylesheet">
        <script>
            var reverseDarkList = {dark: "light", light: "dark"}, themeColor = {dark: "#1c1c1e", light: "#fff"},
                getCssMediaQuery = function () {
                    return window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"
                }, reverseDarkModeSetting = function () {
                    var e = localStorage.getItem("user-color-scheme");
                    if (reverseDarkList[e]) e = reverseDarkList[e]; else {
                        if (null !== e) return;
                        e = reverseDarkList[getCssMediaQuery()]
                    }
                    return localStorage.setItem("user-color-scheme", e), e
                }
        </script>
        <script>
            var setDarkmode = function (e) {
                e = e || localStorage.getItem("user-color-scheme");
                e === getCssMediaQuery() ? (document.documentElement.removeAttribute("data-user-color-scheme"), localStorage.removeItem("user-color-scheme"), document.getElementById("theme-color").content = themeColor[e], document.getElementById("theme-color").dataset.mode = e) : reverseDarkList[e] ? (document.documentElement.setAttribute("data-user-color-scheme", e), document.getElementById("theme-color").content = themeColor[e], document.getElementById("theme-color").dataset.mode = e) : (document.documentElement.removeAttribute("data-user-color-scheme"), localStorage.removeItem("user-color-scheme"), document.getElementById("theme-color").content = themeColor[getCssMediaQuery()], document.getElementById("theme-color").dataset.mode = getCssMediaQuery()), prismThemeChange()
            };
            setDarkmode()
        </script>
        <link href="https://at.alicdn.com/t/font_1946621_i1kgafibvw.css" rel="preload" as="style">
        <link href="https://at.alicdn.com/t/font_1952792_89b4ac4k4up.css" rel="preload" as="style">
        <link href="/Kaze/source/js/lib/lightbox/baguetteBox.min.js" rel="preload" as="script">
        <link href="/Kaze/source/js/lib/lightbox/baguetteBox.min.css" rel="preload" as="style">
        <link href="/Kaze/source/js/lib/lozad.min.js" rel="preload" as="script">
        <link href="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" rel="prefetch" as="script">
        <link href="https://unpkg.com/valine/dist/Valine.min.js" rel="prefetch" as="script">
        <link href="/Kaze/source/css/main.css" rel="stylesheet">
        <link href="https://at.alicdn.com/t/font_1946621_i1kgafibvw.css" rel="stylesheet">
        <link href="https://at.alicdn.com/t/font_1952792_89b4ac4k4up.css" rel="stylesheet">
        <meta content="Hexo 5.4.0" name="generator">
    </head>
    <body>
</#macro>

<#macro footer>
    <script src="/Kaze/source/js/main.js"></script>
    <script>loadScript("/Kaze/source/js/lib/busuanzi.min.js")</script>
    <script>
        var addLazyload = function () {
            lozad(".lozad", {
                load: function (a) {
                    a.srcset = a.getAttribute("data-src")
                }, loaded: function (a) {
                    a.classList.add("loaded")
                }
            }).observe()
        }
    </script>
    <script>loadScript("/Kaze/source/js/lib/lozad.min.js", addLazyload)</script>
    <script>var googleAnalytics = function () {
            function a() {
                dataLayer.push(arguments)
            }

            window.dataLayer = window.dataLayer || [], a("js", new Date), a("config", "UA-167309243-2")
        }
    </script>
    <script>loadScript("https://www.googletagmanager.com/gtag/js?id=UA-167309243-2", googleAnalytics)</script>
    <script>
        setTimeout(() => {
            localSearch("search.json")
        }, 0)
    </script>

    </body>
    </html>
</#macro>