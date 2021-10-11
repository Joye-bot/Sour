<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sour后台管理-附件</title>
    <link rel="stylesheet" href="/static/css/adminlte.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
</head>
<body>

<div class="wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header"></div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-5">

                    <!-- Theme Image -->
                    <div class="card card-default card-outline">
                        <div class="card-body">
                            <div class="text-center">
                                <img class="img-fluid" src="${attachment.attachPath!}" alt="picture">
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col -->

                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">详细信息</h3>
                        </div>


                        <div class="card-body">
                            <div class="form-group row">
                                <label for="attachName" class="col-sm-2">附件名</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="attachName"
                                           value="${attachment.attachName!}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="attachType" class="col-sm-2">附件类型</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="attachType"
                                           value="${attachment.attachType!}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="attachPath" class="col-sm-2">附件路径</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="attachPath"
                                           value="${attachment.attachPath!}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="attachCreated" class="col-sm-2">上传时间</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="attachCreated"
                                           value="${attachment.attachCreated!}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="attachStorage" class="col-sm-2">附件大小</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="attachStorage" disabled>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="attachSize" class="col-sm-2">图片尺寸</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="attachSize" disabled>
                                </div>
                            </div>

                        </div>

                        <div class="card-footer">
                            <button type="button" class="btn btn-sm btn-danger" onclick="btn_delete();">删除</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

</div>

<script src="/static/plugins/jquery/jquery.min.js"></script>
<script src="/static/js/adminlte.min.js"></script>
<script src="/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- layer -->
<script src="/static/plugins/layer/layer.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
<script>
    function btn_delete() {
        layer.msg('你确定要删除？', {
            time: 0,
            btn: ['删除', '取消'],
            yes: function (index) {
                layer.close(index);
                $.ajax({
                    type: 'get',
                    url: '/admin/attachments/remove',
                    async: false,
                    data: {
                        attachId: ${attachment.attachId}
                    },
                    success: function (data) {
                        if (data !== null) {
                            Swal.fire({
                                toast: true,
                                timer: 2000,
                                text: "删除成功！",
                                icon: 'success',
                                position: 'top-end',
                                showConfirmButton: false
                            }).then(function () {
                                parent.location.reload();
                            });
                        } else {
                            showMsg("删除失败", "error", 2000);
                        }
                    }
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

</body>
</html>
