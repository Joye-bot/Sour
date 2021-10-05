<#include "module/macro.ftl">
<@head title="主页"></@head>

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

                    <#list posts.content as post>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <a href="/archives/${post.postUrl}" class="position-relative">
                                        <img src="/static/images/next.jpg" alt="Photo 1" class="img-fluid">
                                    </a>
                                </div>
                                <div class="card-footer">
                                    <a href="/archives/${post.postUrl}" style="color: black;">${post.postTitle}</a>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>

                <div class="clearfix">
                    <ul class="pagination pagination-sm m-0 float-right">

                        <li class="page-item">
                            <a class="page-link" href="#">«</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#">1</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#">»</a>
                        </li>
                    </ul>
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

<footer></footer>


