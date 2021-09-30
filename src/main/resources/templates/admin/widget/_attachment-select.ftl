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
    <!-- Ekko Lightbox -->
    <link rel="stylesheet" href="/static/plugins/ekko-lightbox/ekko-lightbox.css">

    <!-- bootstrap file input -->
    <link href="https://cdn.bootcdn.net/ajax/libs/bootstrap-fileinput/5.2.3/css/fileinput.min.css" rel="stylesheet">

</head>
<body class="hold-transition sidebar-mini">


<div class="container-fluid">
    <section class="content">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header p-0 border-bottom-0">
                        <ul class="nav nav-tabs">

                            <!-- 所有附件 -->
                            <li class="nav-item">
                                <a class="nav-link active" id="all-attachment-tab" data-toggle="pill"
                                   href="#all-attachment" role="tab" aria-controls="all-attachment"
                                   aria-selected="true">所有附件</a>
                            </li>

                            <!-- 选择上传 -->
                            <li class="nav-item">
                                <a class="nav-link" id="password-tab" data-toggle="pill" href="#password"
                                   role="tab" aria-controls="password" aria-selected="false">选择上传</a>
                            </li>

                        </ul>


                    </div>

                    <div class="card-body">
                        <div class="tab-content">

                            <!-- 所有附件 -->
                            <div class="tab-pane fade show active" id="all-attachment" role="tabpanel"
                                 aria-labelledby="all-attachment-tab" aria-selected="false">

                                <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <a href="https://via.placeholder.com/1200/FFFFFF.png?text=1"
                                                   data-toggle="lightbox" data-titl="sample 1 - white"
                                                   data-gallery="gallery">
                                                    <img src="https://via.placeholder.com/300/FFFFFF?text=1"
                                                         class="img-fluid mb-2" alt="white sample">
                                                </a>
                                            </div>
                                            <div class="col-sm-2">
                                                <a href="https://via.placeholder.com/1200/000000.png?text=2"
                                                   data-toggle="lightbox" data-titl="sample 2 - black"
                                                   data-gallery="gallery">
                                                    <img src="https://via.placeholder.com/300/000000?text=2"
                                                         class="img-fluid mb-2" alt="black sample">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="card-footer">
                                    <h3 class="card-title">第1页</h3>
                                    <div class="float-right">
                                        <a href="#" class="btn btn-sm btn-default">«</a>
                                        <a href="#" class="btn btn-sm btn-default">1</a>
                                        <a href="#" class="btn btn-sm btn-default">2</a>
                                        <a href="#" class="btn btn-sm btn-default">»</a>
                                    </div>
                                </div>
                            </div>

                            <!-- 选择上传 -->
                            <div class="tab-pane fade" id="password" role="tabpanel"
                                 aria-labelledby="password-tab" aria-selected="true">

                                <input id="input-b3" name="input-b3[]" type="file" class="file" multiple
                                       data-show-upload="false" data-show-caption="true" data-msg-placeholder="Select {files} for upload...">

                            </div>

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
<!-- Ekko Lightbox -->
<script src="/static/plugins/ekko-lightbox/ekko-lightbox.min.js"></script>
<!-- bootstrap file input -->
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-fileinput/5.2.3/js/locales/zh.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-fileinput/5.2.3/js/fileinput.min.js"></script>

<script>
    $(function () {
        $(document).on('click', '[data-toggle="lightbox"]', function (event) {
            event.preventDefault();
            $(this).ekkoLightbox({
                alwaysShowClose: true
            });
        });
    })
</script>

</body>
</html>
