<#include "module/_macro.ftlh">
<@head title="Sour后台管理"></@head>

<div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">

        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">

            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="nav-icon fas fa-link"></i>
                </a>
            </li>

            <!-- Messages Dropdown menu-->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-envelope"></i>
                    <span class="badge badge-success navbar-badge">4</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="/static/images/default.png" alt="User Avatar"
                                 class="img-size-50 mr-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Brad Diesel
                                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">Call me whenever you can...</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">查看所有评论</a>
                </div>
            </li>

            <li class="nav-item dropdown user-menu">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                    <img class="user-image" src="/static/images/default.png" alt="User Image">
                </a>
                <div class="dropdown-menu" style="left: inherit; right: 0; width: 17px;">
                    <a class="dropdown-item" tabindex="-1" href="#">个人资料</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" tabindex="-1" href="#">退出登录</a>
                </div>
            </li>

        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-light-primary elevation-4">

        <!-- Brand Logo -->
        <a href="index.html" class="brand-link text-center">
            <h3><b>So</b>ur</h3>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">

                    <!-- 仪表盘 -->
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>仪表盘</p>
                        </a>
                    </li>

                    <!-- 文章 -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>文章 <i class="right fas fa-angle-left"></i></p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>所有文章</p>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>写文章</p>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>分类目录</p>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>标签</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- 页面 -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-book-open"></i>
                            <p>页面<i class="fas fa-angle-left right"></i></p>
                        </a>

                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>所有页面</p>
                                </a>
                            </li>
                        </ul>

                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>新建页面</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- 附件 -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-image"></i>
                            <p>附件</p>
                        </a>
                    </li>

                    <!-- 评论 -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-comment"></i>
                            <p>评论<span class="badge badge-info right">4</span></p>
                        </a>
                    </li>

                    <!-- 外观 -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tshirt"></i>
                            <p>外观<i class="fas fa-angle-left right"></i></p>
                        </a>

                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>主题</p>
                                </a>
                            </li>
                        </ul>

                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>菜单</p>
                                </a>
                            </li>
                        </ul>

                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>自定义</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- 用户 -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-user"></i>
                            <p>用户<i class="fas fa-angle-left right"></i></p>
                        </a>

                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>个人资料</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- 系统 -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-cog"></i>
                            <p>系统<i class="fas fa-angle-left right"></i></p>
                        </a>

                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>网站设置</p>
                                </a>
                            </li>
                        </ul>

                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>备份恢复</p>
                                </a>
                            </li>
                        </ul>

                    </li>
                </ul>
            </nav>

            <!-- /sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">仪表盘</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">仪表盘</li>
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
                    <div class="col-md-3 col-sm-6 col-12">
                        <div class="info-box">
                            <span class="info-box-icon"><i class="far fa-edit"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">文章</span>
                                <span class="info-box-more">1,410</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-12">
                        <div class="info-box">
                            <span class="info-box-icon"><i class="far fa-comment"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">评论</span>
                                <span class="info-box-number">410</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-12">
                        <div class="info-box">
                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">阅读量</span>
                                <span class="info-box-number">13,648</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-12">
                        <div class="info-box">
                            <span class="info-box-icon"><i class="far fa-calendar-times"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">建立天数</span>
                                <span class="info-box-number">93,139</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">最新动态</h3>
                            </div>

                            <div class="card-body table-responsive p-0" style="display: block;">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="recent-articles-tab" data-toggle="pill"
                                           href="#recent-articles" role="tab" aria-controls="recent-articles"
                                           aria-selected="true">最近文章</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="recent-comments-tab" data-toggle="pill"
                                           href="#recent-comments" role="tab" aria-controls="recent-comments"
                                           aria-selected="false">最近评论</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="recent-articles" role="tabpanel"
                                         aria-labelledby="recent-articles-tab" aria-selected="false">
                                        <table class="table table-head-fixed text-nowrap">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <a href="#" target="_blank">Vue基础教程</a>
                                                </td>
                                                <td>2021-07-22</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="recent-comments" role="tabpanel"
                                         aria-labelledby="recent-comments-tab" aria-selected="true">
                                        <!--<table class="table table-head-fixed text-nowrap">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <a href="#" target="_blank">Vue</a>
                                                </td>
                                                <td>2021-07-22</td>
                                            </tr>
                                            </tbody>
                                        </table>-->
                                        <div class="container-fluid">Hello World!</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">速记</h3>
                            </div>

                            <!--<ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" href="/admin/posts">最近文章</a></li>
                                <li class="nav-item"><a class="nav-link" href="/admin/posts">最近动态</a></li>
                            </ul>-->

                            <!-- <div class="card-body table-responsive p-0" style="display: block;">
                                 <table class="table table-head-fixed text-nowrap">
                                    &lt;!&ndash; <tbody>
                                     <tr>
                                         <td>
                                             <a href="#" target="_blank">Vue基础教程</a>
                                         </td>
                                         <td>2021-07-22</td>
                                     </tr>
                                     </tbody>&ndash;&gt;
                                     <textarea class="form-control" rows="3" id="cateDesc"></textarea>
                                 </table>
                             </div>-->

                            <div class="card-body table-responsive p-0">
                                <div class="container">
                                    <label for="shorthand"></label>
                                    <textarea class="form-control" cols="5" rows="5" id="shorthand"
                                              placeholder="写点什么吧..."></textarea>
                                    <label for="shorthand"></label>
                                </div>
                            </div>

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">发布</button>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">

                                <h3 class="card-title">操作记录</h3>

                                <div class="card-tools">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-tool dropdown-toggle"
                                                data-toggle="dropdown" aria-expanded="false">
                                            <i class="fas fa-bars"></i>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#" class="dropdown-item" onclick="">查看所有</a></li>
                                            <li><a href="#" class="dropdown-item">清空日志</a></li>
                                        </ul>
                                    </div>
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"
                                            title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body table-responsive p-0" style="display: block;">
                                <table class="table table-head-fixed text-nowrap">
                                    <tbody>
                                    <tr>
                                        <td>用户登录</td>
                                        <td>妞妞大魔王</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>

</div>
