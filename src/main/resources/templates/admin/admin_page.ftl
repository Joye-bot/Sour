<#compress >
    <#include "module/_macro.ftl">
    <@head title="Sour后台管理-所有页面"></@head>
    <style>
        .label {
            display: inline;
            padding: .2em .6em .3em;
            font-size: 75%;
            font-weight: bold;
            line-height: 1;
            color: #ffffff;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: .2em;
        }
    </style>

    <body class="hold-transition sidebar-mini">

    <div class="wrapper">

        <!-- 导航栏模块 -->
        <#include "module/_navbar.ftl">

        <!-- 侧边栏模块 -->
        <#include "module/_sidebar.ftl">

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">页面</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">首页</a></li>
                                <li class="breadcrumb-item active">页面</li>
                                <li class="breadcrumb-item active">所有页面</li>
                            </ol>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header p-0 border-bottom-0">
                                    <ul class="nav nav-tabs">

                                        <!-- 独立页面 -->
                                        <li class="nav-item">
                                            <a class="nav-link active" id="standalone-page-tab" data-toggle="pill"
                                               href="#standalone-page" role="tab" aria-controls="standalone-page"
                                               aria-selected="true">独立页面</a>
                                        </li>

                                        <!-- 自定义页面 -->
                                        <li class="nav-item">
                                            <a class="nav-link" id="custom-page-tab" data-toggle="pill"
                                               href="#custom-page"
                                               role="tab" aria-controls="custom-page" aria-selected="false">自定义页面</a>
                                        </li>
                                    </ul>


                                </div>

                                <div class="card-body table-responsive p-0" style="display: block;">
                                    <div class="tab-content">

                                        <!-- 独立页面 -->
                                        <div class="tab-pane fade show active" id="standalone-page" role="tabpanel"
                                             aria-labelledby="standalone-page-tab" aria-selected="false">
                                            <div class="form-group">
                                                <table class="table table-head-fixed text-nowrap">
                                                    <thead>
                                                    <tr>
                                                        <th>页面名称</th>
                                                        <th>访问地址</th>
                                                        <th>状态</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <!-- 友情链接 -->
                                                    <tr>
                                                        <td>友情链接</td>
                                                        <td>
                                                            <a href="#" target="_blank">https://www.nndmw.club/links</a>
                                                        </td>
                                                        <td>可用</td>
                                                        <td>
                                                            <a class="label bg-info" href="/admin/post">管理</a>
                                                            <a class="label bg-primary" href="/admin/post">访问</a>
                                                        </td>
                                                    </tr>

                                                    <!-- 图库页面 -->
                                                    <tr>
                                                        <td>图库页面</td>
                                                        <td>
                                                            <a href="#"
                                                               target="_blank">https://www.nndmw.club/photos</a>
                                                        </td>
                                                        <td>可用</td>
                                                        <td>
                                                            <a class="label bg-info" href="/admin/post">管理</a>
                                                            <a class="label bg-primary" href="/admin/post">访问</a>
                                                        </td>
                                                    </tr>

                                                    <!-- 日志页面 -->
                                                    <tr>
                                                        <td>日志页面</td>
                                                        <td>
                                                            <a href="#"
                                                               target="_blank">https://www.nndmw.club/journals</a>
                                                        </td>
                                                        <td>可用</td>
                                                        <td>
                                                            <a class="label bg-info" href="/admin/post">管理</a>
                                                            <a class="label bg-primary" href="/admin/post">访问</a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <!-- 自定义页面 -->
                                        <div class="tab-pane fade" id="custom-page" role="tabpanel"
                                             aria-labelledby="custom-page-tab" aria-selected="true">
                                            <div class="form-group">
                                                <table class="table table-head-fixed text-nowrap">
                                                    <thead>
                                                    <tr>
                                                        <th>标题</th>
                                                        <th>状态</th>
                                                        <th>评论</th>
                                                        <th>访问量</th>
                                                        <th>发布时间</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>友情链接</td>
                                                        <td>已发布</td>
                                                        <td>7</td>
                                                        <td>32</td>
                                                        <td>2021-09-14 13:32</td>
                                                        <td>
                                                            <a class="label bg-info" href="/admin/post">编辑</a>
                                                            <a class="label bg-danger" href="/admin/post">回收</a>
                                                            <a class="label bg-primary" href="/admin/post">设置</a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </section>
        </div>
        <!-- /.content-wrapper -->

        <!-- footer -->
        <#include "module/_footer.ftl">

    </div>
    <@footer></@footer>

</#compress>