<#include "module/_macro.ftl">
<@head title="${options.blog_title} | Sour后台管理-评论"></@head>

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
                        <h1 class="m-0">评论</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                            <li class="breadcrumb-item active">评论</li>
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
                                <div class="card-title">评论状态</div>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body p-0">
                                <ul class="nav nav-pills flex-column">
                                    <li class="nav-item active">
                                        <a data-pja="true" href="/admin/comments" class="nav-link">
                                            <i class="fas fa-inbox"></i> 已发布
                                            <span class="badge bg-primary float-right">${publicCount!"0"}</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a data-pjax="true" href="/admin/comments?status=1" class="nav-link">
                                            <i class="far fa-file-alt"></i> 待审核
                                            <span class="badge bg-warning float-right">${checkCount!"0"}</span>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a data-pjax="true" href="/admin/comments?status=2" class="nav-link">
                                            <i class="far fa-trash-alt"></i> 回收站
                                            <span class="badge bg-danger float-right">${trashCount!"0"}</span>
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
                                <h3 class="card-title">所有评论</h3>
                            </div>

                            <div class="card-body table-responsive p-0">
                                <table class="table table-head-fixed text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>昵称</th>
                                        <th>内容</th>
                                        <th>评论文章</th>
                                        <th>日期</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if comments.content?size gt 0>
                                        <#list comments.content as comment>
                                            <tr>
                                                <td>
                                                    <a href="${comment.commentAuthorUrl!}"
                                                       target="_blank">${comment.commentAuthor}</a>
                                                </td>
                                                <td>
                                                    <label style="font-weight: normal;">${comment.commentContent}</label>
                                                </td>
                                                <td>
                                                    <a href="/archives/${comment.post.postUrl}"
                                                       target="_blank">${comment.post.postTitle}</a>
                                                </td>
                                                <td>${comment.commentDate?string("yyyy-MM-dd")}</td>
                                                <td>
                                                    <#switch comment.commentStatus>
                                                        <#case 0>
                                                            <button class="btn btn-xs btn-info"
                                                                    onclick="replyShow('${comment.commentId}','${comment.post.postId}');">
                                                                回复
                                                            </button>
                                                            <button class="btn btn-xs btn-danger"
                                                                    onclick="modelShow('/admin/comments/throw?commentId=${comment.commentId}','确定移动到回收站？');">
                                                                丢弃
                                                            </button>
                                                            <#break >
                                                        <#case 1>
                                                            <a data-pjax="true" class="btn btn-xs btn-primary"
                                                               href="/admin/comments/revert?commentId=${comment.commentId}&status=1">通过</a>
                                                            <button class="btn btn-xs btn-info"
                                                                    onclick="replyShow('${comment.commentId}','${comment.post.postId}');">
                                                                回复
                                                            </button>
                                                            <button class="btn btn-xs btn-danger"
                                                                    onclick="modelShow('/admin/comments/throw?commentId=${comment.commentId}','确定移到回收站?');">
                                                                丢弃
                                                            </button>
                                                            <#break >
                                                        <#case 2>
                                                            <a data-pjax="true" class="btn btn-xs btn-primary"
                                                               href="/admin/comments/revert?commentId=${comment.commentId}&status=2">还原</a>
                                                            <button class="btn btn-xs btn-danger"
                                                                    onclick="modelShow('/admin/comments/remove?commentId=${comment.commentId}&status=2','确定要永久删除？');">
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
                                <h3 class="card-title">第${comments.number+1}/${comments.totalPages}页</h3>

                                <div class="card-tools">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <li class="page-item">
                                            <a data-pjax="true"
                                               class="page-link <#if !comments.hasPrevious()>disabled</#if>"
                                               href="/admin/comments?status=${status}">&laquo;</a>
                                        </li>
                                        <li class="page-item">
                                            <a data-pjax="true"
                                               class="page-link <#if !comments.hasPrevious()>disabled</#if>"
                                               href="/admin/comments?status=${status}&page=${comments.number-1}">&lt;</a>
                                        </li>
                                        <li class="page-item">
                                            <a data-pjax="true"
                                               class="page-link <#if !comments.hasNext()>disabled</#if>"
                                               href="/admin/comments?status=${status}&page=${comments.number+1}">&gt;</a>
                                        </li>
                                        <li class="page-item">
                                            <a data-pjax="true"
                                               class="page-link <#if !comments.hasNext()>disabled</#if>"
                                               href="/admin/comments?status=${status}$page=${comments.totalPages-1}">&raquo;</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->

                </div>
            </div>
        </section>

        <!-- 删除确认弹出层 -->
        <div class="modal fade" id="removeCommentModal">
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

        <!-- 回复弹出层 -->
        <div class="modal fade" id="commentReplyModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">提示信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="/admin/comments/reply">
                        <div class="modal-body">
                            <textarea class="form-control" rows="5" id="commentContent"
                                      name="commentContent" style="resize: none;"></textarea>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="commentId" name="commentId" value="">
                            <input type="hidden" id="userAgent" name="userAgent" value="">
                            <input type="hidden" id="postId" name="postId" value="">
                            <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-sm btn-danger">确定</button>
                        </div>
                    </form>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-content -->
        </div>

    </div>
    <!-- /.content-wrapper -->

    <!-- footer -->
    <#include "module/_footer.ftl">

</div>

<script>
    function removeIt() {
        window.location.href = $.trim($("#url").val());
    }

    function replyShow(commentId, postId) {
        $('#userAgent').val(navigator.userAgent);
        $('#commentId').val(commentId);
        $('#postId').val(postId);
        $('#commentReplyModal').modal();
    }

    function modelShow(url, message) {
        $('#url').val(url);
        $('#message').html(message);
        $('#removeCommentModal').modal();
    }
</script>

<@footer></@footer>
