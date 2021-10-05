<#include "module/_macro.ftl">
<@head title="${options.blog_title} | Sour后台管理-主题编辑"></@head>

<!-- editor.md -->
<link rel="stylesheet" href="/static/plugins/editor.md/css/editormd.min.css">
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
                            <li class="breadcrumb-item active">主题编辑</li>
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
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">${options.theme!'default'}</h3>
                            </div>
                            <div class="card-body p-0">
                                <ul class="nav nav-pills flex-column">
                                    <#list tpls as tpl>
                                        <li class="nav-item">
                                            <a href="#" class="nav-link" onclick="loadContent('${tpl}')">${tpl}</a>
                                        </li>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- right column -->
                    <div class="col-md-8">
                        <div class="card card-default card-outline">
                            <!--<div class="card-header">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-sm btn-danger">保存草稿</button>
                                    <button type="submit" class="btn btn-sm btn-default">预览</button>
                                    &lt;!&ndash;<button type="submit" class="btn btn-sm btn-primary" >发布</button>&ndash;&gt;
                                    <a class="btn btn-sm btn-primary" data-widget="control-sidebar" data-slide="true"
                                       href="#" role="button">发布</a>
                                    <button type="submit" class="btn btn-sm btn-default">附件库</button>
                                </div>
                                &lt;!&ndash;<a class="btn btn-danger btn-sm">保存草稿</a>
                                <a class="btn btn-primary btn-sm">发布</a>&ndash;&gt;

                            </div>-->
                            <div class="card-header">
                                <h3 class="card-title" id="tplNameTitle"></h3>
                            </div>
                            <div class="card-body">
                                <!--<div class="form-group">
                                    <input type="text" class="form-control" placeholder="请输入文章标题">
                                </div>-->
                                <div class="form-group">
                                    <!-- editor.md -->
                                    <div id="markdown-editor">
                                        <textarea style="display: none;"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary" onclick="saveTpl();">保存</button>
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

<!-- layer -->
<script src="/static/plugins/layer/layer.js"></script>
<!-- editor.md -->
<script src="/static/plugins/editor.md/editormd.min.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>

<script type="text/javascript">
    let editor;
    $(function () {
        editor = editormd("markdown-editor", {
            width: "100%",
            height: 640,
            syncScrolling: "single",
            path: "/static/plugins/editor.md/lib/",
            watch: false,
            toolbar: false,
            codeFold: true,
            searchReplace: true,
            placeholder: "Enjoy coding!",
            value: (localStorage.mode) ? $("#" + localStorage.mode.replace("text/", "") + "-code").val() : $("#html-code").val(),
            theme: (localStorage.theme) ? localStorage.theme : "default",
            mode: (localStorage.mode) ? localStorage.mode : "text/html"
        });
    });

    function loadContent(tplName) {
        if (tplName && tplName != '') {
            $.ajax({
                type: 'GET',
                url: '/admin/themes/getTpl',
                async: false,
                data: {
                    tplName: tplName
                },
                success: function (data) {
                    editor.setValue(data);
                    $('#tplNameTitle').html(tplName);
                }
            });
        } else {
            editor.setValue('');
            $('#tplNameTitle').html('');
        }
    }

    function saveTpl() {
        $.ajax({
            type: 'POST',
            url: '/admin/themes/editor/save',
            async: false,
            data: {
                'tplName': $('#tplNameTitle').html(),
                'tplContent': editor.getValue()
            },
            success: function (data) {
                if (data === true) {
                    Swal.fire({
                        toast: true,
                        timer: 2000,
                        text: "保存成功！",
                        icon: 'success',
                        position: 'top-end',
                        showConfirmButton: false
                    });
                } else {
                    Swal.fire({
                        toast: true,
                        timer: 2000,
                        text: "保存失败！",
                        icon: 'error',
                        position: 'top-end',
                        showConfirmButton: false
                    });
                }
            }
        });
    }
</script>

<@footer></@footer>

