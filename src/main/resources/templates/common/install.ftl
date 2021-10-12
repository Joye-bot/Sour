<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sour安装向导</title>
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/css/adminlte.min.css">
    <!-- BS-Stepper -->
    <link rel="stylesheet" href="/static/plugins/bs-stepper/css/bs-stepper.min.css">
    <!-- bootstrap validator -->
    <link rel="stylesheet" href="/static/plugins/bootstrapvalidator/css/bootstrapValidator.min.css">
</head>
<body>

<div class="wrapper" style="top: 25px;">

    <section class="content-header"></section>

    <!-- Main content -->
    <section class="content">
        <div class="container">
            <div class="row">

                <div class="col-md-12">
                    <div class="card card-default">
                        <div class="card-header">
                            <h3 class="card-title">Sour安装向导</h3>
                        </div>

                        <div class="card-body p-0">
                            <div class="bs-stepper">
                                <div class="bs-stepper-header" role="tablist">

                                    <!-- your steps here-->
                                    <div class="step" data-target="#logins-part">
                                        <button type="button" class="step-trigger" role="tab"
                                                aria-controls="logins-part" id="logins-part-trigger">
                                            <span class="bs-stepper-circle">1</span>
                                            <span class="bs-stepper-label">安装</span>
                                        </button>
                                    </div>
                                    <div class="line"></div>
                                    <div class="step" data-target="#information-part">
                                        <button type="button" class="step-trigger" role="tab"
                                                aria-controls="information-part" id="information-part-trigger">
                                            <span class="bs-stepper-circle">2</span>
                                            <span class="bs-stepper-label">完成</span>
                                        </button>
                                    </div>
                                </div>

                                <div class="bs-stepper-content">
                                    <!-- your steps content here -->
                                    <div id="logins-part" class="content" role="tabpanel"
                                         aria-labelledby="logins-part-trigger">

                                        <#if isInstall==false>
                                            <form method="post" action="/install/do" id="installForm">
                                                <div class="card-body" id="installFirst">
                                                    <div class="form-group row">
                                                        <label for="blogTitle" class="col-sm-2">网址标题</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="blogTitle"
                                                                   name="blogTitle"
                                                                   value="">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="blogUrl" class="col-sm-2">网站地址</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="blogUrl"
                                                                   name="blogUrl"
                                                                   value="">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="userEmail" class="col-sm-2">电子邮箱</label>
                                                        <div class="col-sm-6">
                                                            <input type="email" class="form-control" id="userEmail"
                                                                   name="userEmail"
                                                                   value="">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="userName" class="col-sm-2">用户名</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="userName"
                                                                   name="userName"
                                                                   value="">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="userDisplayName" class="col-sm-2">显示昵称</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="userDisplayName"
                                                                   name="userDisplayName" value="">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="userPwd" class="col-sm-2">登录密码</label>
                                                        <div class="col-sm-6">
                                                            <input type="password" class="form-control" id="userPwd"
                                                                   name="userPwd"
                                                                   value="">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="confirmPwd" class="col-sm-2">确认密码</label>
                                                        <div class="col-sm-6">
                                                            <input type="password" class="form-control" id="confirmPwd"
                                                                   name="confirmPwd" value="">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card-footer">
                                                    <div class="float-right">
                                                        <button class="btn btn-sm btn-primary"
                                                                onclick="stepper.next();">
                                                            安装Sour
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        <#else >
                                            <div class="card-body">
                                                <h2>已经安装过了</h2>
                                            </div>
                                        </#if>

                                    </div>

                                    <div id="information-part" class="content" role="tabpanel"
                                         aria-labelledby="information-part-trigger">
                                        <div class="card-body" id="installSuccess">
                                            <div class="form-group">
                                                <h2>安装成功!</h2>
                                                <h4>你可以选择进入前台，或者登录后台！</h4>
                                            </div>
                                        </div>

                                        <div class="card-footer">
                                            <a class="btn btn-sm btn-primary" href="/">前台</a>
                                            <div class="float-right">
                                                <a class="btn btn-sm btn-primary" href="/admin/login">登录后台</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

</div>

<!-- jQuery -->
<script src="/static/plugins/jquery/jquery.min.js"></script>
<!-- BS-Stepper -->
<script src="/static/plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- bootstrap validator -->
<script src="/static/plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script src="/static/plugins/bootstrapvalidator/js/language/zh_CN.js"></script>
<script>
    // BS-Stepper Init
    document.addEventListener('DOMContentLoaded', function () {
        window.stepper = new Stepper(document.querySelector('.bs-stepper'))
    });

    const domain = window.location.host;

    $(document).ready(function () {
        $('#blogUrl').val("https://" + domain);
        $('#installForm').bootstrapValidator({
            message: '安装表单验证失败',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                blogTitle: {
                    message: '网站标题验证失败',
                    validators: {
                        notEmpty: {
                            message: '网站标题不能为空'
                        }
                    }
                },
                userEmail: {
                    message: '邮箱验证失败',
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱格式有误'
                        }
                    }
                },
                userName: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 24,
                            message: '用户名超出长度限制'
                        }
                    }
                },
                userPwd: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '密码长度必须在6到18位之间'
                        }
                    }
                },
                confirmPwd: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'userPwd',
                            message: '两次输入的密码不相符'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            e.preventDefault();
            const $form = $(e.target);
            const bv = $form.data('bootstrapValidator');
            $.post($form.attr('action'), $form.serialize(), function (result) {
                if (result === true) {
                    $('#installFirst').hide();
                    $('#installSuccess').show();
                } else {
                    $('#installFirst').hide();
                    $('#installError').show();
                }
            }, 'json');
        });
    });
</script>

</body>
</html>
