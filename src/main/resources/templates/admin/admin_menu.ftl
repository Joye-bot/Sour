<#include "module/_macro.ftl">
<@head title="Sour后台管理-菜单"></@head>

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
                        <h1 class="m-0">菜单</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">外观</li>
                            <li class="breadcrumb-item active">菜单</li>
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
                                <h3 class="card-title">添加菜单</h3>
                            </div>
                            <!-- /.card-header -->

                            <!-- form start-->
                            <form>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="menuName">名称</label>
                                        <input type="text" class="form-control" id="menuName">
                                        <small>* 页面上所显示的名称</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="menuAlias">别名</label>
                                        <input type="text" class="form-control" id="menuAlias">
                                        <small>* 一般为单个分类页面的标识，最好为英文</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="menuSort">排序编号</label>
                                        <input type="text" class="form-control" id="menuSort">
                                    </div>
                                    <div class="form-group">
                                        <label for="menuIcon">图标</label>
                                        <input type="text" class="form-control" id="menuIcon">
                                        <small>* 可选项，支持部分字体图标</small>
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
                                <h3 class="card-title">菜单列表</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"
                                            title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body table-responsive p-0" style="display: block;">
                                <table class="table table-head-fixed text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>名称</th>
                                        <th>别名</th>
                                        <th>排序</th>
                                        <th>图标</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Java</td>
                                        <td>java</td>
                                        <td>1</td>
                                        <td></td>
                                        <td>
                                            <!--<span class="label bg-yellow">待审核</span>-->
                                            <!-- <span class="label bg-info">修改</span>-->
                                            <a href="#" class="label bg-info">修改</a>
                                            <a href="#" class="label bg-danger">删除</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="card-footer clearfix">
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
                                        <a class="page-link" href="#">»</a>
                                    </li>
                                </ul>
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