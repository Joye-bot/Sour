<#compress >
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sour后台登录</title>
        <!-- Animate -->
        <link rel="stylesheet" href="/static/plugins/animate/animate.min.css">
        <!-- SweetAlert2 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="/static/css/adminlte.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
    </head>
    <body class="hold-transition login-page">

    <div class="login-box">
        <div class="card card-outline">
            <div class="card-header text-center">
                <a href="#" class="h1"><b>So</b>ur</a>
            </div>

            <div class="card-body animate__animated">
                <form>
                    <div class="input-group mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.1s;">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                        <input type="text" class="form-control" id="login-name" name="loginName"
                               placeholder="User/Email" value="admin">
                    </div>

                    <div class="input-group mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.2s;">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                        <input type="password" class="form-control" id="login-pwd" name="loginPwd"
                               placeholder="Password" value="123456">
                    </div>

                    <div class="row animate__animated animate__fadeInUp" style="animation-delay: 0.4s;">
                        <div class="col-12">
                            <button type="button" class="btn btn-primary btn-block" id="btn-login"
                                    data-loading-text="登录中..." onclick="btn_login()">
                                登录
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="/static/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/static/js/adminlte.min.js"></script>
    <script>
        function btn_login() {
            $('#btn-login').button('loading');
            const name = $('#login-name').val();
            const pwd = $('#login-pwd').val();
            if (name === "" || pwd === "") {
                showMsg("请输入完整信息！", "info", 3000);
                $('#btn-login').button('reset');
            } else {
                $.ajax({
                    type: 'post',
                    url: '/admin/getLogin',
                    async: false,
                    data: {
                        'loginName': name,
                        'loginPwd': pwd
                    },
                    success: function (status) {
                        if (status === "true") {
                            Swal.fire({
                                toast: true,
                                timer: 3000,
                                text: "登录成功！",
                                icon: 'success',
                                position: 'top-end',
                                showConfirmButton: false
                            }).then(function () {
                                window.location.href = "/admin";
                            });
                        } else if (status === "disabled") {
                            $('.card-body').addClass('animate__animated animation__shake');
                            Swal.fire({
                                toast: true,
                                timer: 3000,
                                text: "密码错误已达到5次，请10分钟后再试！",
                                icon: 'error',
                                position: 'top-end',
                                showConfirmButton: false
                            }).then(function () {
                                $('.card-body').removeClass('animate__animated animation__shake');
                            });
                            $('#btn-login').button('reset');
                        } else {
                            $('.card-body').addClass('animate__animated animation__shake');
                            Swal.fire({
                                toast: true,
                                timer: 3000,
                                text: '用户名或者密码错误！',
                                icon: 'error',
                                position: 'top-end',
                                showConfirmButton: false
                            }).then(function () {
                                $('.card-body').removeClass('animate__animated animation__shake');
                            });
                            $('#btn-login').button('reset');
                        }
                    }
                });
            }
        }

        /**
         * Enter
         */
        $(document).keydown(function (event) {
            if (event.keyCode === 13) {
                btn_login();
            }
        });

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
</#compress>