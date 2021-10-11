<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sour后台管理-个人资料</title>
    <link rel="stylesheet" href="/static/css/adminlte.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
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
                                <img class="img-fluid"
                                     src="/static/images/next.jpg" alt="User profile picture">
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col -->

                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header p-0 border-bottom-0">
                            <ul class="nav nav-tabs">

                                <!-- 社交资料 -->
                                <li class="nav-item">
                                    <a class="nav-link active" id="sns-tab" data-toggle="pill"
                                       href="#sns" role="tab" aria-controls="sns"
                                       aria-selected="true">社交资料</a>
                                </li>

                                <!-- 关于 -->
                                <li class="nav-item">
                                    <a class="nav-link" id="about-tab" data-toggle="pill" href="#about"
                                       role="tab" aria-controls="about" aria-selected="false">关于</a>
                                </li>
                            </ul>
                        </div>

                        <div class="card-body">
                            <div class="tab-content">

                                <!-- 基本资料 -->
                                <form class="tab-pane fade show active" id="sns"
                                      aria-labelledby="sns-tab" aria-selected="false">

                                    <div class="form-group">
                                        <label for="snsTwitter">Twitter</label>
                                        <input type="text" class="form-control col-sm-7" id="snsTwitter" name="snsTwitter">
                                    </div>

                                    <div class="form-group">
                                        <label for="snsFacebook">Facebook</label>
                                        <input type="text" class="form-control col-sm-7" id="snsFacebook" name="snsFacebook">
                                    </div>

                                    <div class="form-group">
                                        <label for="snsEmail">Email</label>
                                        <input type="email" class="form-control col-sm-7" id="snsEmail" name="snsEmail">
                                    </div>

                                    <div class="form-group">
                                        <label for="snsGithub">Github</label>
                                        <input type="text" class="form-control col-sm-7" id="snsGithub" name="snsGithub">
                                    </div>

                                    <div class="card-footer">
                                        <div class="float-right">
                                            <button type="submit" class="btn btn-primary btn-sm" onclick="saveUser();">
                                                保存
                                            </button>
                                        </div>
                                    </div>
                                </form>

                                <!-- 关于 -->
                                <form class="tab-pane fade" id="about"
                                      aria-labelledby="about-tab" aria-selected="true">
                                    <div class="form-group">
                                        <p>Github issues : <a href="https://github.com/nndmw/Sour" target="_blank">https://github.com/nndmw/Sour</a></p>
                                        <p>Blog : <a href="https://www.nndmw.club" target="_blank">https://www.nndmw.club</a></p>
                                        <p>QQ : 2541019174</p>
                                    </div>
                                </form>

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

</body>
</html>
