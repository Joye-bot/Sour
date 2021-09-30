<#compress >
    <#include "module/_macro.ftl">
    <@head title="${options.blog_title} | Sour后台管理-附件"></@head>

    <!-- Ekko Lightbox -->
    <link rel="stylesheet" href="/static/plugins/ekko-lightbox/ekko-lightbox.css">

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
                            <h1 class="m-0">附件</h1>
                        </div>
                        <!-- /.col -->

                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                                <li class="breadcrumb-item active">附件</li>
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
                        <div class="col-12" id="accordion">
                            <div class="card card-default">

                                <a class="d-block w-100" data-toggle="collapse" href="#collapseOne">
                                    <div class="card-header">
                                        <button type="submit" class="btn btn-sm btn-primary">上传</button>
                                    </div>
                                </a>

                                <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <a href="https://via.placeholder.com/1200/FFFFFF.png?text=1"
                                                   data-toggle="lightbox" data-titl="sample 1 - white"
                                                   data-gallery="gallery">
                                                    <img src="https://via.placeholder.com/300/FFFFFF?text=1"
                                                         class="img-fluid mb-2" alt="white sample">
                                                </a>
                                            </div>
                                            <div class="col-sm-2">
                                                <a href="https://via.placeholder.com/1200/000000.png?text=2"
                                                   data-toggle="lightbox" data-titl="sample 2 - black"
                                                   data-gallery="gallery">
                                                    <img src="https://via.placeholder.com/300/000000?text=2"
                                                         class="img-fluid mb-2" alt="black sample">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <h3 class="card-title">第1页</h3>
                            <div class="float-right">
                                <a href="#" class="btn btn-sm btn-default">«</a>
                                <a href="#" class="btn btn-sm btn-default">1</a>
                                <a href="#" class="btn btn-sm btn-default">2</a>
                                <a href="#" class="btn btn-sm btn-default">»</a>
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

    <!-- Ekko Lightbox -->
    <script src="/static/plugins/ekko-lightbox/ekko-lightbox.min.js"></script>
    <!-- Filterizr -->
    <script src="/static/plugins/filterizr/filterizr.min.js"></script>

    <script>
        $(function () {
            $(document).on('click', '[data-toggle="lightbox"]', function (event) {
                event.preventDefault();
                $(this).ekkoLightbox({
                    alwaysShowClose: true
                });
            });
        })
    </script>

</#compress>