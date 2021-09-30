<#compress >
    <#include "module/_macro.ftl">
    <@head title="${options.blog_title} | Sour后台管理-分类目录"></@head>
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
                            <h1 class="m-0">分类目录</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                                <li class="breadcrumb-item"><a data-pjax="true" href="#">文章</a></li>
                                <li class="breadcrumb-item active">分类目录</li>
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
                                    <h3 class="card-title">添加分类</h3>
                                </div>
                                <!-- /.card-header -->

                                <#if updateCategory??>
                                    <!-- form start-->
                                    <form action="/admin/category/save" method="post" role="form" id="cateAddForm">
                                        <input type="hidden" name="cateId" value="${updateCategory.cateId}">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="cateName">名称</label>
                                                <input type="text" class="form-control" id="cateName" name="cateName"
                                                       value="${updateCategory.cateName}">
                                                <small>* 页面上所显示的名称</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="cateUrl">别名</label>
                                                <input type="text" class="form-control" id="cateUrl" name="cateUrl"
                                                       value="${updateCategory.cateUrl}">
                                                <small>* 一般为单个分类页面的标识，最好为英文</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="cateDesc">描述</label>
                                                <textarea class="form-control" rows="3" id="cateDesc" name="cateDesc"
                                                          style="resize: none;">${updateCategory.cateDesc!}</textarea>
                                                <small>* 分类描述，部分主题可显示</small>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->

                                        <div class="card-footer">
                                            <!-- <button type="submit" class="btn btn-primary btn-sm">更新</button> -->
                                            <button type="submit" class="btn btn-primary btn-sm">${statusName}</button>
                                            <a data-pjax="true" href="/admin/category" class="btn btn-sm btn-default">返回添加</a>
                                        </div>
                                    </form>
                                <#else >
                                    <!-- form start-->
                                    <form action="/admin/category/save" method="post" role="form" id="cateAddForm"
                                          onsubmit="return checkCate();">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="cateName">名称</label>
                                                <input type="text" class="form-control" id="cateName" name="cateName">
                                                <small>* 页面上所显示的名称</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="cateUrl">别名</label>
                                                <input type="text" class="form-control" id="cateUrl" name="cateUrl">
                                                <small>* 一般为单个分类页面的标识，最好为英文</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="cateDesc">描述</label>
                                                <textarea class="form-control" rows="3" id="cateDesc" name="cateDesc"
                                                          style="resize: none;"></textarea>
                                                <small>* 分类描述，部分主题可显示</small>
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
                                    <h3 class="card-title">分类列表</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"
                                                title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body table-responsive p-0" style="display: block;">
                                    <table class="table table-head-fixed text-nowrap">
                                        <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>别名</th>
                                            <th>描述</th>
                                            <th>文章数</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <@commonTag method="categories">
                                            <#list categories as cate>
                                                <tr>
                                                    <td>${cate.cateName}</td>
                                                    <td>${cate.cateUrl}</td>
                                                    <td>${cate.cateDesc!}</td>
                                                    <td>3</td>
                                                    <td>
                                                        <a data-pjax="true" href="/admin/category/edit?cateId=${cate.cateId}"
                                                           class="btn btn-xs bg-info">修改</a>
                                                        <button class="btn btn-xs btn-danger"
                                                                onclick="modelShow('/admin/category/remove?cateId=${cate.cateId}');">
                                                            删除
                                                        </button>
                                                    </td>
                                                </tr>
                                            </#list>
                                        </@commonTag>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="card-footer clearfix">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <li class="page-item">
                                            <a class="page-link" href="#">«</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">1</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">2</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">»</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 删除确认弹出层 -->
            <div class="modal fade" id="removeCateModal">
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

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
    <script>
        function checkCate() {
            const name = $('#cateName').val();
            const url = $('#cateUrl').val();
            const desc = $('#cateDesc').val();
            let result = true;
            if (name === "" || url === "" || desc === "") {
                showMsg("输入完整信息！", "info", 2000);
                result = false;
            }
            $.ajax({
                type: 'GET',
                url: '/admin/category/checkUrl',
                async: false,
                data: {
                    'cateUrl': url
                },
                success: function (data) {
                    if (data === true) {
                        showMsg("该路径已经存在！", "info", 2000);
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
            $('#removeCateModal').modal();
        }
    </script>

    <@footer></@footer>
</#compress>