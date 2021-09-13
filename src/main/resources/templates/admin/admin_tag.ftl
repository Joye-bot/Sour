<#compress >
    <#include "module/_macro.ftl">
    <@head title="Sour后台管理-标签"></@head>

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
                            <h1 class="m-0">标签</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">首页</a></li>
                                <li class="breadcrumb-item active">文章</li>
                                <li class="breadcrumb-item active">标签</li>
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
                        <!-- left column -->
                        <div class="col-md-5">
                            <!-- general form elements -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">添加标签</h3>
                                </div>
                                <!-- /.card-header -->

                                <!-- form start-->
                                <form>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="tagName">名称</label>
                                            <input type="text" class="form-control" id="tagName">
                                            <small>* 页面上所显示的名称</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="tagUrl">别名</label>
                                            <input type="text" class="form-control" id="tagUrl">
                                            <small>* 一般为单个标签页面的标识，最好为英文</small>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->

                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary btn-sm">保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- right column -->
                        <div class="col-md-7">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">所有标签</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"
                                                title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <!--<table class="table table-head-fixed text-nowrap text-center">
                                        <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>路径</th>
                                            <th>文章数</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>Java</td>
                                            <td>java</td>
                                            <td>3</td>
                                            <td>
                                                &lt;!&ndash;<span class="label bg-yellow">待审核</span>&ndash;&gt;
                                                &lt;!&ndash; <span class="label bg-info">修改</span>&ndash;&gt;
                                                <a href="/admin/category" class="label bg-info">修改</a>
                                                <a href="/admin/category" class="label bg-danger">删除</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>-->
                                    <div class="container-fluid">
                                        <span class="label" style="background-color: rgb(0,192,239)">Vue</span>
                                        <span class="label" style="background-color: rgb(0,192,239)">Java</span>
                                        <span class="label" style="background-color: rgb(0,192,239)">JavaScript</span>
                                        <span class="label" style="background-color: rgb(0,192,239)">Spring Boot</span>
                                        <span class="label" style="background-color: rgb(0,192,239)">Linux</span>
                                        <span class="label" style="background-color: rgb(0,192,239)">Emacs</span>
                                        <span class="label" style="background-color: rgb(0,192,239)">Neovim</span>
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