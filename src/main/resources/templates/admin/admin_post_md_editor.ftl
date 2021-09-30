<#include "module/_macro.ftl">
<@head title="${options.blog_title} | Sour后台管理-写文章"></@head>

<!-- editor.md -->
<link rel="stylesheet" href="/static/plugins/editor.md/css/editormd.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="/static/plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="/static/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
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
                                    <button type="submit" class="btn btn-sm btn-danger" onclick="push(1);">保存草稿</button>
                                    <button type="submit" class="btn btn-sm btn-default">预览</button>
                                    <a class="btn btn-sm btn-primary" data-widget="control-sidebar"
                                       data-slide="true"
                                       href="#" role="button">发布</a>
                                    <button type="submit" class="btn btn-sm btn-default">附件库</button>
                                </div>
                            </div>
                            <div class="card-body">
                                <#if post??>
                                    <input type="hidden" id="postId" name="postId" value="${post.postId}">
                                </#if>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="post_title" name="post_title"
                                           placeholder="请输入文章标题"
                                           value="<#if post??>${post.postTitle}</#if>">
                                </div>
                                <div class="form-group">
                                    <!-- editor.md -->
                                    <div id="markdown-editor">
                                        <textarea
                                                style="display: none;"><#if post??>${post.postContentMd!}</#if></textarea>
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
                           placeholder="" value="<#if post??>${post.postUrl}</#if>">
                    <small>https://127.0.0.1:8080//</small>
                </div>
                <div class="dropdown-divider"></div>

                <!-- 分类目录 -->
                <div class="form-group">
                    <label for="categoryList">分类目录</label>
                    <#list categories as cate>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="categoryList" name="categoryList"
                                   value="${cate.cateId}">
                            <label class="form-check-label">${cate.cateName}</label>
                        </div>
                    </#list>
                </div>
                <div class="dropdown-divider"></div>

                <!-- 标签-->
                <div class="form-group">
                    <label>标签</label>
                    <select class="select2" multiple="multiple" id="tagList" data-placeholder="选择或输入标签"
                            style="width: 100%;">
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
                    <#if post??>
                        <img class="card-img-top" src="${post.postThumbnail!"/static/images/placeholder.jpg"}" alt=""
                             id="selectImg"
                             onclick="openAttach('selectImg')">
                    <#else >
                        <img class="card-img-top" src="/static/images/placeholder.jpg" alt="" id="selectImg"
                             onclick="openAttach('selectImg')">
                    </#if>
                </div>
            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary btn-sm float-right" onclick="push(0);">保存</button>
            </div>
        </div>
    </aside>

    <!-- footer -->
    <#include "module/_footer.ftl">

</div>

<!-- Select2-->
<script src="/static/plugins/select2/js/select2.full.min.js"></script>
<!-- layer -->
<script src="/static/plugins/layer/layer.js"></script>
<!-- editor.md -->
<script src="/static/plugins/editor.md/editormd.min.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>

<script type="text/javascript">
    function openAttach(e) {
        layer.open({
            type: 2,
            title: '附件',
            shadeClose: true,
            shade: 0.5,
            maximum: true,
            area: ['70%', '80%'],
            content: '/admin/attachments/select?id=' + e,
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
    });

    const postTitle = $("#post_title");
    const cateList = [];
    const postUrl = $("#postUrl");

    /**
     * 提交文章
     * @param status 文章状态
     */
    function push(status) {
        let Title = "";
        let Url = "";
        if (postTitle.val()) {
            Title = postTitle.val();
        } else {
            showMsg("标题不能为空！", "info", 2000);
            return;
        }
        $('input[name="categoryList"]:checked').each(function () {
            cateList.push($(this).val());
        });

        if (postUrl.val()) {
            Url = postUrl.val();
        } else {
            showMsg("固定链接不能为空！", "info", 2000);
            return;
        }

        /*if ($('#postUrl').html() === "") {
            showMsg("固定链接不能为空！", "info", 2000);
            return;
        }*/
        $.ajax({
            type: 'POST',
            url: '/admin/posts/new/push',
            async: false,
            data: {
                <#if post??>
                'postId': $('#postId').val(),
                </#if>
                'postStatus': status,
                'postTitle': Title,
                'postUrl': Url,
                'postContentMd': editor.getMarkdown(),
                'postContent': editor.getTextareaSavedHTML(),
                'postThumbnail': $('#selectImg')[0].src,
                'cateList': cateList.toString(),
                'tagList': $('#tagList').val().toString()
            },
            success: function (data) {
                Swal.fire({
                    toast: true,
                    timer: 2000,
                    text: "发布成功！",
                    icon: 'success',
                    position: 'top-end',
                    showConfirmButton: false
                }).then(function () {
                    window.location.href = "/admin/posts";
                });
            }
        });
    }

    function showMsg(text, icon, timer) {
        Swal.fire({
            toast: true,
            timer: timer,
            text: text,
            icon: icon,
            position: 'top-end',
            showConfirmButton: false
        });
    }
</script>

<@footer></@footer>
