<#include "module/_macro.ftl">
<@head title="${options.blog_title} | Sour后台管理-主题"></@head>
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
                    <div class="col-12" id="accordionTwo">
                        <div class="card card-default">

                            <a class="d-block w-100" data-toggle="collapse" href="#collapseTwo">
                                <div class="card-header">
                                    <button type="submit" class="btn btn-sm btn-primary">上传</button>
                                </div>
                            </a>

                            <div id="collapseTwo" class="collapse" data-parent="#accordionTwo">
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

                            <div class="card-body">
                                <div class="row">
                                    <#if themes?? &&(themes?size>0)>
                                        <#list themes as theme>
                                            <div class="col-sm-4">
                                                <div class="position-relative">
                                                    <img src="/${theme.themeName!}/screenshot.png" alt="Photo 1"
                                                         class="img-fluid">
                                                </div>
                                                <div class="card-footer">
                                                    <span class="card-title">${theme.themeName}</span>
                                                    <div class="float-right">
                                                        <#if activeTheme != "${theme.themeName}">
                                                            <button type="submit" class="btn btn-sm btn-info"
                                                                    onclick="setTheme('${theme.themeName!}');">启动
                                                            </button>
                                                        <#else >
                                                            <button type="submit" class="btn btn-sm btn-default">已启动
                                                            </button>
                                                        </#if>
                                                        <#if theme.hasOptions==true>
                                                            <button type="submit" class="btn btn-sm btn-primary"
                                                                    onclick="openSetting('${theme.themeName!}');">设置
                                                            </button>
                                                        </#if>
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

<!-- bootstrap file input -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-fileinput@5.2.6/js/fileinput.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-fileinput@5.2.6/js/locales/zh.js"></script>
<!-- layer -->
<script src="/static/plugins/layer/layer.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<script>
    $(document).ready(function () {
        loadFileInput();
    });

    function loadFileInput() {
        $('#uploadImg').fileinput({
            language: 'zh',
            uploadUrl: '/admin/themes/upload',
            allowedFileExtensions: ['zip', 'jpg'],
            maxFileCount: 1,
            enctype: 'multipart/form-data',
            dropZoneTitle: '拖拽主题压缩包到这里 &hellip;<br>不支持多个主题同时上传',
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

    function setTheme(site_theme) {
        $.ajax({
            type: 'get',
            url: '/admin/themes/set',
            data: {
                'siteTheme': site_theme
            },
            success: function (data) {
                if (data === true) {
                    Swal.fire({
                        toast: true,
                        timer: 2000,
                        text: "设置中...",
                        icon: 'info',
                        position: 'top-end',
                        showConfirmButton: false
                    }).then(function () {
                        window.location.reload();
                    });
                }
            }
        });
    }

    function openSetting(theme) {
        layer.open({
            type: 2,
            title: theme + '主题设置',
            maximum: true,
            shadeClose: true,
            shade: 0.5,
            area: ['90%', '90%'],
            content: '/admin/themes/options?theme=' + theme,
            scrollbar: false
        });
    }
</script>

<@footer></@footer>
