<#include "module/_macro.ftl">
<@head title="Sour后台管理-主题"></@head>

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

        .header {
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
            background-color: #ffffff;
            padding: 7px 10px;
            border-bottom: 1px solid #f4f4f4;
            color: #444444;
            font-size: 14px
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
                        <h1 class="m-0">外观</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">外观</li>
                            <li class="breadcrumb-item active">主题</li>
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
                    <div class="col-12">
                        <div class="card card-default">

                            <div class="card-header">
                                <button type="submit" class="btn btn-sm btn-primary">上传</button>
                            </div>
                            <!-- /.card-header -->

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="position-relative">
                                            <img src="/static/images/next.jpg" alt="Photo 1" class="img-fluid">
                                        </div>
                                        <div class="card-footer">
                                            <span class="card-title">Anatole</span>
                                            <div class="float-right">
                                                <button type="submit" class="btn btn-sm btn-info">启动</button>
                                                <button type="submit" class="btn btn-sm btn-default">已启动</button>
                                                <button type="submit" class="btn btn-sm btn-primary">设置</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="position-relative">
                                            <img src="/static/images/next.jpg" alt="Photo 1" class="img-fluid">
                                        </div>
                                        <div class="card-footer">
                                            <span class="card-title">Anatole</span>
                                            <div class="float-right">
                                                <button type="submit" class="btn btn-sm btn-info">启动</button>
                                                <button type="submit" class="btn btn-sm btn-default">已启动</button>
                                                <button type="submit" class="btn btn-sm btn-primary">设置</button>
                                            </div>
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
