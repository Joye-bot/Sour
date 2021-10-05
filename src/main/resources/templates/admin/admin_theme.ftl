<#include "module/_macro.ftl">
<@head title="${options.blog_title} | Sour后台管理-主题"></@head>

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
                            <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                            <li class="breadcrumb-item"><a data-pjax="true" href="#">外观</a></li>
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
                                    <#if themes?? &&(themes?size>0)>
                                        <#list themes as theme>
                                            <div class="col-sm-4">
                                                <div class="position-relative">
                                                    <img src="/static/images/next.jpg" alt="Photo 1" class="img-fluid">
                                                </div>
                                                <div class="card-footer">
                                                    <span class="card-title">${theme.themeName}</span>
                                                    <div class="float-right">
                                                        <button type="submit" class="btn btn-sm btn-info">启动</button>
                                                        <button type="submit" class="btn btn-sm btn-default">已启动
                                                        </button>
                                                        <button type="submit" class="btn btn-sm btn-primary">设置</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </#list>
                                    </#if>
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
