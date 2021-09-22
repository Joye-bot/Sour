<#compress >
    <#include "module/_macro.ftl">
    <@head title="Sour后台管理-标签"></@head>
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
                            <h1 class="m-0">标签</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                                <li class="breadcrumb-item"><a data-pjax="true" href="#">文章</a></li>
                                <li class="breadcrumb-item active">标签</li>
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
                        <div class="col-md-5">
                            <!-- general form elements -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">添加标签</h3>
                                </div>
                                <!-- /.card-header -->

                                <#if updateTag??>
                                    <!-- form start-->
                                    <form action="/admin/tag/save" method="post" role="form">
                                        <input type="hidden" name="tagId" value="${updateTag.tagId}">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="tagName">名称</label>
                                                <input type="text" class="form-control" id="tagName" name="tagName"
                                                       value="${updateTag.tagName}">
                                                <small>* 页面上所显示的名称</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="tagUrl">别名</label>
                                                <input type="text" class="form-control" id="tagUrl" name="tagUrl"
                                                       value="${updateTag.tagUrl}">
                                                <small>* 一般为单个标签页面的标识，最好为英文</small>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->

                                        <div class="card-footer">
                                            <!-- <button type="submit" class="btn btn-primary btn-sm">保存</button> -->
                                            <button type="submit" class="btn btn-primary btn-sm">${statusName}</button>
                                            <a data-pjax="true" href="/admin/tag" class="btn btn-sm btn-default">返回添加</a>
                                            <#if updateTag.posts?size = 0>
                                                <!-- <a href="/admin/tag/remove?tagId=${updateTag.tagId}"
                                                   class="btn btn-sm btn btn-danger float-right">删除</a> -->
                                                <a data-pjax="true" class="btn btn-sm btn-danger float-right"
                                                        onclick="modelShow('/admin/tag/remove?tagId=${updateTag.tagId}');">
                                                    删除
                                                </a>
                                            </#if>
                                        </div>
                                    </form>
                                <#else >
                                    <!-- form start-->
                                    <form action="/admin/tag/save" method="post" role="form"
                                          onsubmit="return checkTag();">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="tagName">名称</label>
                                                <input type="text" class="form-control" id="tagName" name="tagName">
                                                <small>* 页面上所显示的名称</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="tagUrl">别名</label>
                                                <input type="text" class="form-control" id="tagUrl" name="tagUrl">
                                                <small>* 一般为单个标签页面的标识，最好为英文</small>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->

                                        <div class="card-footer">
                                            <!-- <button type="submit" class="btn btn-primary btn-sm">保存</button> -->
                                            <button type="submit" class="btn btn-primary btn-sm">${statusName}</button>
                                        </div>
                                    </form>
                                </#if>
                            </div>
                        </div>

                        <!-- right column -->
                        <div class="col-md-7">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">所有标签</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"
                                                title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="container-fluid">
                                        <#list tags as tag>
                                            <a data-pjax="true" href="/admin/tag/edit?tagId=${tag.tagId}" class="badge badge-primary"
                                               style="background-color: rgb(0,192,239);">${tag.tagName}</a>
                                        </#list>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 删除确认弹出层 -->
            <div class="modal fade" id="removeTagModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">提示信息</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>您确定要删除吗？</p>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="url">
                            <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
                            <a onclick="removeIt()" class="btn btn-sm btn-danger" data-dismiss="modal">确定</a>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->

        </div>
        <!-- /.content-wrapper -->

        <!-- footer -->
        <#include "module/_footer.ftl">

    </div>
    <@footer></@footer>

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
    <script>
        function checkTag() {
            const name = $('#tagName').val();
            const url = $('#tagUrl').val();
            let result = true;
            if (name === "" || url === "") {
                showMsg("请输入完整信息！", "info", 2000);
                result = false;
            }
            $.ajax({
                type: 'GET',
                url: '/admin/tag/checkUrl',
                async: false,
                data: {
                    'tagUrl': url
                },
                success: function (data) {
                    if (data === true) {
                        showMsg("该路径已存在！", "info", 2000);
                        result = false;
                    }
                }
            });
            return result;
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

        function removeIt() {
            window.location.href = $.trim($("#url").val());
        }

        function modelShow(url) {
            $('#url').val(url);
            $('#removeTagModal').modal();
        }
    </script>

</#compress>