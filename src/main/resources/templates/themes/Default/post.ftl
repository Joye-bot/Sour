<#include "module/macro.ftl">
<@head title="文章"></@head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/prismjs@1.25.0/themes/prism.css">

<div class="wrapper">

    <!-- 导航栏模块 -->
    <#include "module/navbar.ftl">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <section class="content-header"></section>

        <!-- Main content -->
        <section class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-default">
                            <h1>${post.postTitle}</h1>
                            <div class="card-body">
                                ${post.postContent}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- /.content-wrapper -->

    <!-- footer -->
    <footer class="main-footer">
        <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> 3.1.0
        </div>
    </footer>

</div>

<script src="https://cdn.jsdelivr.net/npm/prismjs@1.25.0/prism.js"></script>

<@footer></@footer>