<#include "module/_macro.ftl">
<@head title="Sour后台管理-仪表盘"></@head>

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

                                    <!-- 最近文章 -->
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
                                            <tr>
                                                <td>
                                                    <a href="#" target="_blank">Java基础教程</a>
                                                </td>
                                                <td>2021-09-15</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- 最近评论 -->
                                    <div class="tab-pane fade" id="recent-comments" role="tabpanel"
                                         aria-labelledby="recent-comments-tab" aria-selected="true">
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
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">速记</h3>
                            </div>

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
                                            <li><a href="/admin/logs" class="dropdown-item"
                                                   onclick="openAllLogs()">查看所有</a></li>
                                            <li><a href="/admin/logs/clear" class="dropdown-item">清空日志</a></li>
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
    <!-- /.content-wrapper -->

    <!-- footer -->
    <#include "module/_footer.ftl">
</div>


<@footer></@footer>

<script src="/static/plugins/layer/layer.js"></script>
<script>
    function openAllLogs() {
        layer.open({
            type: 2,
            title: '所有日志',
            maximum: true,
            shadeClose: true,
            shade: 0.5,
            area: ['90%', '90%'],
            content: '/admin/logs',
            scrollbar: false
        });
    }
</script>