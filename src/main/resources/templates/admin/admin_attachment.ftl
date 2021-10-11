<#compress >
    <#include "module/_macro.ftl">
    <@head title="${options.blog_title} | Sour后台管理-附件"></@head>

    <!-- bootstrap file input -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-fileinput@5.2.6/css/fileinput.min.css">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">

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
                        <div class="col-12" id="accordionOne">
                            <div class="card card-default">

                                <a class="d-block w-100" data-toggle="collapse" href="#collapseOne">
                                    <div class="card-header">
                                        <button type="submit" class="btn btn-sm btn-primary">上传</button>
                                    </div>
                                </a>

                                <div id="collapseOne" class="collapse" data-parent="#accordionOne">
                                    <div class="content container-fluid">
                                        <div class="row" id="uploadForm">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div class="file-loading">
                                                        <input id="uploadImg" class="file-loading" type="file" multiple
                                                               name="file">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <#if attachments.content?size gt 0>
                                    <div class="card-body">
                                        <div class="row">
                                            <#list attachments.content as attachment>
                                                <div class="col-sm-2" onclick="openDetail(${attachment.attachId});">
                                                    <a href="#">
                                                        <img src="${attachment.attachSmallPath!}"
                                                             class="img-fluid mb-2" alt="">
                                                    </a>
                                                </div>
                                            </#list>
                                        </div>
                                    </div>
                                </#if>

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

    <!-- bootstrap file input -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-fileinput@5.2.6/js/fileinput.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-fileinput@5.2.6/js/locales/zh.js"></script>
    <!-- layer -->
    <script src="/static/plugins/layer/layer.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>

    <script>
        function openDetail(id) {
            layer.open({
                type: 2,
                title: '附件详情',
                maximum: true,
                shadeClose: true,
                shade: 0.5,
                area: ['90%', '90%'],
                content: '/admin/attachments/attachment?attachId=' + id,
                scrollbar: false
            });
        }

        $(document).ready(function () {
            loadFileInput();
        });

        <#if options.admin_pjax!"true" == "true">
        $(document).one('pjax:complete', function () {
            loadFileInput();
        });
        </#if>

        function loadFileInput() {
            $('#uploadImg').fileinput({
                language: 'zh',
                uploadUrl: '/admin/attachments/upload',
                uploadAsync: true,
                allowedFileExtensions: ['jpg', 'gif', 'png', 'jpeg', 'svg', 'psd'],
                maxFileCount: 100,
                enctype: 'multipart/form-data',
                showClose: false
            }).on("fileuploaded", function (event, data, previewId, index) {
                const dataJson = data.jqXHR.responseJSON;
                    $("#uploadForm").hide(400);
                if (dataJson.success === 1) {
                    Swal.fire({
                        toast: true,
                        timer: 2000,
                        text: "上传成功！",
                        icon: 'success',
                        position: 'top-end',
                        showConfirmButton: false
                    }).then(function () {
                        window.location.reload();
                    });
                }
            });
        }
    </script>

    <@footer></@footer>

</#compress>