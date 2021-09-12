<#include "module/_macro.ftl">
<@head title="Sour后台管理-所有文章"></@head>

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
                        <h1 class="m-0">文章</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item">文章</li>
                            <li class="breadcrumb-item active">所有文章</li>
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
                            <!--<div class="card-header">
                                <h3 class="card-title">所有文章</h3>

                            </div>-->

                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" href="/admin/posts">已发布</a></li>
                                <li class="nav-item"><a class="nav-link" href="/admin/posts">草稿</a></li>
                                <li class="nav-item"><a class="nav-link" href="/admin/posts">回收站</a></li>
                            </ul>

                            <div class="card-body table-responsive p-0" style="display: block;">
                                <table class="table table-head-fixed text-nowrap text-center">
                                    <thead>
                                    <tr>
                                        <th>标题</th>
                                        <th>分类目录</th>
                                        <th>标签</th>
                                        <th>评论</th>
                                        <th>日期</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <a href="#" target="_blank">Vue基础教程</a>
                                        </td>

                                        <td>JavaScript</td>
                                        <td>vue</td>
                                        <td>23</td>
                                        <td>2021-07-22</td>
                                        <td>
                                            <!--<span class="label bg-primary">预览</span>
                                            <span class="label bg-info">修改</span>
                                            <span class="label bg-danger">丢弃</span>-->

                                            <a class="label bg-primary" href="/admin/post">预览</a>
                                            <a class="label bg-info" href="/admin/post">修改</a>
                                            <a class="label bg-danger" href="/admin/post">丢弃</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="card-footer clearfix">
                                <h3 class="card-title">第1页</h3>

                                <div class="card-tools">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <li class="page-item">
                                            <a class="page-link" href="#">首页</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">上一页</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">下一页</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">尾页</a>
                                        </li>
                                    </ul>
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