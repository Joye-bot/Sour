<#include "module/_macro.ftl">
<@head title="${options.blog_title} | Sour后台管理-评论"></@head>

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

                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">评论状态</div>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body p-0">
                                <ul class="nav nav-pills flex-column">
                                    <li class="nav-item active">
                                        <a href="#" class="nav-link">
                                            <i class="fas fa-inbox"></i> 已发布
                                            <span class="badge bg-primary float-right">12</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="far fa-file-alt"></i> 待审核
                                            <span class="badge bg-warning float-right">12</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="far fa-trash-alt"></i> 回收站
                                            <span class="badge bg-danger float-right">12</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>


                        </div>
                    </div>
                    <!-- /.col -->

                    <div class="col-md-9">
                        <div class="card card-default card-outline">

                            <div class="card-header">
                                <h3 class="card-title">所有评论</h3>
                            </div>

                            <div class="card-body table-responsive p-0">
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
                                        <td>User</td>
                                        <td>
                                            <label style="font-weight: normal;">测试评论</label>
                                        </td>
                                        <td>
                                            <a href="#" target="_blank">Java基础教程</a>
                                        </td>
                                        <td>2021-07-22</td>
                                        <td>
                                            <a class="btn btn-xs btn-info" href="#">回复</a>
                                            <a class="btn btn-xs btn-danger" href="#">丢弃</a>
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
                                            <a class="btn btn-sm btn-default" href="#">«</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="btn btn-sm btn-default" href="#">2</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="btn btn-sm btn-default" href="#">3</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="btn btn-sm btn-default" href="#">»</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->

                </div>
            </div>
        </section>
    </div>
    <!-- /.content-wrapper -->

    <!-- footer -->
    <#include "module/_footer.ftl">

</div>
<@footer></@footer>
