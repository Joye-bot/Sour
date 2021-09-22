<#include "module/_macro.ftl">
<@head title="Sour后台管理-写文章"></@head>

<!-- editor.md -->
<link rel="stylesheet" href="/static/plugins/editor.md/css/editormd.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="/static/plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="/static/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

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
                        <h1 class="m-0">文章</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">文章</li>
                            <li class="breadcrumb-item active">写文章</li>
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
                    <div class="col-md-12">
                        <div class="card card-default card-outline">
                            <div class="card-header">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-sm btn-danger">保存草稿</button>
                                    <button type="submit" class="btn btn-sm btn-default">预览</button>
                                    <!--<button type="submit" class="btn btn-sm btn-primary" >发布</button>-->
                                    <a class="btn btn-sm btn-primary" data-widget="control-sidebar"
                                       data-slide="true"
                                       href="#" role="button">发布</a>
                                    <button type="submit" class="btn btn-sm btn-default">附件库</button>
                                </div>
                                <!--<a class="btn btn-danger btn-sm">保存草稿</a>
                                <a class="btn btn-primary btn-sm">发布</a>-->

                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="请输入文章标题">
                                </div>
                                <div class="form-group">
                                    <!-- editor.md -->
                                    <div id="markdown-editor">
                                        <textarea style="display: none;"></textarea>
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

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-light" style="width: 400px;">
        <!-- Control sidebar content goes here-->
        <div class="card card-default">
            <div class="card-header">
                <h2 class="card-title">文章设置</h2>
            </div>
            <div class="card-body">
                <!-- 文章路径 -->
                <div class="form-group">
                    <label for="postUrl">文章路径</label>
                    <input type="text" class="form-control" id="postUrl"
                           placeholder="">
                    <small>https://127.0.0.1:8080//</small>
                </div>
                <div class="dropdown-divider"></div>

                <!-- 分类目录 -->
                <div class="form-group">
                    <label for="categoryList">分类目录</label>
                    <#list categories as cate>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="categoryList" name="categoryList">
                            <label class="form-check-label">${cate.cateName}</label>
                        </div>
                    </#list>
                </div>
                <div class="dropdown-divider"></div>

                <!-- 标签-->
                <div class="form-group">
                    <label>标签</label>
                    <select class="select2" multiple="multiple" data-placeholder="选择或输入标签" style="width: 100%;">
                        <#if tags??>
                            <#list tags as tag>
                                <option>${tag.tagName}</option>
                            </#list>
                        </#if>
                    </select>
                </div>
                <div class="dropdown-divider"></div>

                <!-- 缩略图 -->
                <div class="form-group">
                    <label>缩略图</label>
                    <img class="card-img-top" src="/static/images/placeholder.jpg" alt=""
                         onclick="openAttach('selectImg')">
                </div>
            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary btn-sm float-right">保存</button>
            </div>
        </div>
    </aside>

    <!-- footer -->
    <#include "module/_footer.ftl">

</div>
<@footer></@footer>

<!-- Select2-->
<script src="/static/plugins/select2/js/select2.full.min.js"></script>
<!-- layer -->
<script src="/static/plugins/layer/layer.js"></script>
<!-- editor.md -->
<script src="/static/plugins/editor.md/editormd.min.js"></script>

<script type="text/javascript">
    function openAttach(e) {
        layer.open({
            type: 2,
            title: '所有附件',
            shadeClose: true,
            shade: 0.5,
            maximum: true,
            area: ['70%', '80%'],
            content: '/admin/attachments/selection?id=' + e,
            scrollbar: false
        });
    }

    let editor;
    $(function () {
        // Initialize Select2 Elements
        $('.select2').select2();
        editor = editormd("markdown-editor", {
            width: "100%",
            height: 640,
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