<#include "module/_macro.ftl">
<@head title="Sour后台管理-主题编辑"></@head>

<!-- editor.md -->
<link rel="stylesheet" href="/static/plugins/editor.md/css/editormd.min.css">

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
                                <h3 class="card-title">主题</h3>
                            </div>
                            <div class="card-body p-0">
                                <ul class="nav nav-pills flex-column">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">index.flt</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">theme.flt</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">category.flt</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">tag.flt</a>
                                    </li>
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
                                <button type="submit" class="btn btn-primary">保存</button>
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

<!-- layer -->
<script src="/static/plugins/layer/layer.js"></script>
<!-- editor.md -->
<script src="/static/plugins/editor.md/editormd.min.js"></script>

<script type="text/javascript">
    let editor;
    $(function () {
        editor = editormd("markdown-editor", {
            width: "100%",
            height: 640,
            watch: false,
            toolbar: false,
            syncScrolling: "single",
            path: "/static/plugins/editor.md/lib/",
            saveHTMLToTextarea: true,
            // 上传图片配置
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "pang", "bmp", "webp"],
            imageUploadURL: "/admin/attachments/upload/editor"
        });
    })
</script>
