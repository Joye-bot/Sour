<#compress >
    <#include "module/_macro.ftl">
    <@head title="Sour后台管理-友情链接"></@head>

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
                            <h1 class="m-0">友情链接</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                                <li class="breadcrumb-item"><a data-pjax="true" href="#">页面</a></li>
                                <li class="breadcrumb-item active">友情链接</li>
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
                                    <h3 class="card-title">添加友情链接</h3>
                                </div>
                                <!-- /.card-header -->

                                <!-- form start-->
                                <form>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="linkName">* 网站名称</label>
                                            <input type="text" class="form-control" id="linkName" name="linkName">
                                        </div>
                                        <div class="form-group">
                                            <label for="linkUrl">* 网站地址</label>
                                            <input type="text" class="form-control" id="linkUrl" name="linkUrl">
                                            <small>* 需要加上 https://</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="linkPic">Logo</label>
                                            <input type="text" class="form-control" id="linkPic" name="linkPic">
                                        </div>
                                        <div class="form-group">
                                            <label for="linkDesc">描述</label>
                                            <textarea class="form-control" rows="3" id="linkDesc" name="linkDesc"
                                                      style="resize: none;"></textarea>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->

                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary btn-sm">保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- right column -->
                        <div class="col-md-7">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">所有友情链接</h3>

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
                                            <th>网址</th>
                                            <th>描述</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>Java</td>
                                            <td><a href="https://www.github.com">https://www.github.com</a></td>
                                            <td>你好啊！</td>
                                            <td>
                                                <a href="#" class="btn btn-xs bg-info">编辑</a>
                                                <a href="#" class="btn btn-xs bg-danger">删除</a>
                                            </td>
                                        </tr>
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
                                <span aria-hidden="true">×</span>
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
                </div>
            </div>
            <!-- /.modal -->

        </div>
        <!-- /.content-wrapper -->

        <!-- footer -->
        <#include "module/_footer.ftl">

    </div>
    <@footer></@footer>

    <script>
        function removeIt() {
            window.location.href = $.trim($("#url").val());
        }
    </script>

</#compress>