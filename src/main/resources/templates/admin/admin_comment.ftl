<#include "module/_macro.ftl">
<@head title="Sour后台管理-评论"></@head>
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
                        <h1 class="m-0">评论</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                            <li class="breadcrumb-item active">评论</li>
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

                                    <!-- 已发布 -->
                                    <li class="nav-item">
                                        <a class="nav-link active" id="published-tab" data-toggle="pill"
                                           href="#published" role="tab" aria-controls="published"
                                           aria-selected="true">已发布</a>
                                    </li>

                                    <!-- 待审核 -->
                                    <li class="nav-item">
                                        <a class="nav-link" id="review-tab" data-toggle="pill" href="#review"
                                           role="tab" aria-controls="review" aria-selected="false">待审核</a>
                                    </li>

                                    <!-- 回收站 -->
                                    <li class="nav-item">
                                        <a class="nav-link" id="recycle-bin-tab" data-toggle="pill" href="#recycle-bin"
                                           role="tab" aria-controls="recycle-bin" aria-selected="false">回收站</a>
                                    </li>

                                </ul>


                            </div>

                            <div class="card-body table-responsive p-0" style="display: block;">
                                <div class="tab-content">

                                    <!-- 已发布 -->
                                    <div class="tab-pane fade show active" id="published" role="tabpanel"
                                         aria-labelledby="published-tab" aria-selected="false">
                                        <div class="form-group">
                                            <table class="table table-head-fixed text-nowrap">
                                                <thead>
                                                <tr>
                                                    <th>昵称</th>
                                                    <th>内容</th>
                                                    <th>评论文章</th>
                                                    <th>日期</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>博主</td>
                                                    <td>测试评论</td>
                                                    <td>
                                                        <a href="#" target="_blank">Vue基础教程</a>
                                                    </td>
                                                    <td>2021-09-15</td>
                                                    <td>
                                                        <a class="label bg-info" href="/admin/post">回复</a>
                                                        <!--<a class="label bg-primary" href="/admin/post">丢弃</a>-->
                                                        <a class="label bg-danger" href="/admin/post">丢弃</a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>用户</td>
                                                    <td>你好！</td>
                                                    <td>
                                                        <a href="#" target="_blank">Java基础教程</a>
                                                    </td>
                                                    <td>2021-09-15</td>
                                                    <td>
                                                        <a class="label bg-info" href="/admin/post">回复</a>
                                                        <!--<a class="label bg-primary" href="/admin/post">丢弃</a>-->
                                                        <a class="label bg-danger" href="/admin/post">丢弃</a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>用户</td>
                                                    <td>Hello！</td>
                                                    <td>
                                                        <a href="#" target="_blank">Linux命令</a>
                                                    </td>
                                                    <td>2021-09-15</td>
                                                    <td>
                                                        <a class="label bg-info" href="/admin/post">回复</a>
                                                        <!--<a class="label bg-primary" href="/admin/post">丢弃</a>-->
                                                        <a class="label bg-danger" href="/admin/post">丢弃</a>
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- 待审核 -->
                                    <div class="tab-pane fade" id="review" role="tabpanel"
                                         aria-labelledby="review-tab" aria-selected="true">
                                        <div class="form-group">
                                            <table class="table table-head-fixed text-nowrap">
                                                <thead>
                                                <tr>
                                                    <th>昵称</th>
                                                    <th>内容</th>
                                                    <th>评论文章</th>
                                                    <th>日期</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>用户</td>
                                                    <td>测试评论</td>
                                                    <td>Linux命令</td>
                                                    <td>2021-09-14</td>
                                                    <td>
                                                        <!--<a class="label bg-info" href="#">回复</a>-->
                                                        <a class="label bg-primary" href="#">通过</a>
                                                        <a class="label bg-danger" href="#">丢弃</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- 回收站 -->
                                    <div class="tab-pane fade" id="recycle-bin" role="tabpanel"
                                         aria-labelledby="recycle-bin-tab" aria-selected="true">
                                        <div class="form-group">
                                            <table class="table table-head-fixed text-nowrap">
                                                <thead>
                                                <tr>
                                                    <th>昵称</th>
                                                    <th>内容</th>
                                                    <th>评论文章</th>
                                                    <th>日期</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>博主</td>
                                                    <td>Hello World!</td>
                                                    <td>JavaScript教程</td>
                                                    <td>2021-09-14</td>
                                                    <td>
                                                        <a class="label bg-success" href="#">恢复</a>
                                                        <a class="label bg-danger" href="#">删除</a>
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
