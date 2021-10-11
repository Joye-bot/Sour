<#include "module/_macro.ftl">
<@head title="${options.blog_title} | Sour后台管理-所有文章"></@head>

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
                            <li class="breadcrumb-item"><a href="/admin">首页</a></li>
                            <li class="breadcrumb-item">文章</li>
                            <li class="breadcrumb-item active">所有文章</li>
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

                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">文章状态</div>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body p-0">
                                <ul class="nav nav-pills flex-column">
                                    <li class="nav-item active">
                                        <a data-pjax="true" href="/admin/posts" class="nav-link">
                                            <i class="fas fa-inbox"></i> 已发布
                                            <span class="badge bg-primary float-right">${publishCount}</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a data-pjax="true" href="/admin/posts?status=1" class="nav-link">
                                            <i class="far fa-file-alt"></i> 草稿
                                            <span class="badge bg-warning float-right">${draftCount}</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a data-pjax="true" href="/admin/posts?status=2" class="nav-link">
                                            <i class="far fa-trash-alt"></i> 回收站
                                            <span class="badge bg-danger float-right">${trashCount}</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>


                        </div>
                    </div>
                    <!-- /.col -->

                    <div class="col-md-9">
                        <div class="card card-default card-outline">

                            <div class="card-header">
                                <h3 class="card-title">所有文章</h3>
                            </div>

                            <div class="card-body table-responsive p-0">
                                <table class="table table-head-fixed text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>标题</th>
                                        <th>分类目录</th>
                                        <th>标签</th>
                                        <th>评论</th>
                                        <th>日期</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if posts.content?size gt 0>
                                        <#list posts.content as post>
                                            <tr>
                                                <td>
                                                    <a href="#" target="_blank">${post.postTitle}</a>
                                                </td>

                                                <td>
                                                    <#if post.categories?size gt 0>
                                                        <#list post.categories as cate>
                                                            <label style="font-weight: normal;">${cate.cateName}</label>
                                                        </#list>
                                                    </#if>
                                                </td>

                                                <td>
                                                    <#if post.tags?size gt 0>
                                                        <#list post.tags as tag>
                                                            <a data-pjax="true" href="#" class="badge badge-primary"
                                                               style="background-color: rgb(0,192,239);">${tag.tagName}</a>
                                                        </#list>
                                                    </#if>
                                                </td>

                                                <td>
                                                    <span class="badge badge-danger">${post.getComments()?size}</span>
                                                </td>
                                                <td>${post.postDate!?string("yyyy-MM-dd")}</td>
                                                <td>
                                                    <#switch post.postStatus>
                                                        <#case 0>
                                                            <a class="btn btn-xs btn-primary"
                                                               href="/archives/${post.postUrl}" target="_blank">查看</a>
                                                            <a class="btn btn-xs btn-info"
                                                               href="/admin/posts/edit?postId=${post.postId}">修改</a>
                                                            <button class="btn btn-xs btn-danger"
                                                                    onclick="modelShow('/admin/posts/throw?postId=${post.postId}','确定移到回收站？')">
                                                                丢弃
                                                            </button>
                                                            <#break >
                                                        <#case 1>
                                                            <a class="btn btn-xs btn-primary"
                                                               href="/admin/posts/view?postId=${post.postId}"
                                                               target="_blank">预览</a>
                                                            <a class="btn btn-xs btn-info"
                                                               href="/admin/posts/edit?postId=${post.postId}">修改</a>
                                                            <button class="btn btn-xs btn-danger"
                                                                    onclick="modelShow('/admin/posts/revert?postId=${post.postId}&status=1','确定发布该文章？')">
                                                                发布
                                                            </button>
                                                            <#break >
                                                        <#case 2>
                                                            <a class="btn btn-xs btn-primary"
                                                               href="/admin/posts/revert?postId=${post.postId}&status=2">还原</a>
                                                            <button class="btn btn-xs btn-danger"
                                                                    onclick="modelShow('/admin/posts/remove?postId=${post.postId}&postType=${post.postType}','确定删除？')">
                                                                删除
                                                            </button>
                                                            <#break >

                                                    </#switch>
                                                </td>
                                            </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>

                            <div class="card-footer clearfix">
                                <h3 class="card-title">第${posts.number+1}/${posts.totalPages}页</h3>

                                <div class="card-tools">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <li class="page-item">
                                            <a class="btn btn-sm btn-default" href="#">«</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="btn btn-sm btn-default" href="#">2</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="btn btn-sm btn-default" href="#">3</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="btn btn-sm btn-default" href="#">»</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->

                </div>
                <!-- /.row -->

            </div>
        </section>

        <!-- 删除确认弹出层 -->
        <div class="modal fade" id="removePostModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">提示信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="message"></p>
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

<script>
    function modelShow(url, message) {
        $('#url').val(url);
        $('#message').html(message);
        $('#removePostModal').modal();
    }

    function removeIt() {
        window.location.href = $.trim($("#url").val());
    }
</script>

<@footer></@footer>
