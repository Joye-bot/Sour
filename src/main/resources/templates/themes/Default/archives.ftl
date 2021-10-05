<#include "module/macro.ftl">
<@head title="归档"></@head>

<div class="wrapper">

    <!-- 导航栏模块 -->
    <#include "module/navbar.ftl">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <section class="content-header">
            <div class="container">
                <div class="row">
                    <h1>2021.09</h1>
                </div>
            </div>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container">

                <div class="row">

                    <@articleTag method="archivesLess">
                        <#list archivesLess as archive>
                            <#list archive.posts?sort_by("postDate")?reverse as post>
                                <div class="col-md-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <a href="#" class="position-relative">${post.postTitle}</a>
                                            <div class="small">2021-09-25</div>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </#list>
                    </@articleTag>

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

<@footer></@footer>