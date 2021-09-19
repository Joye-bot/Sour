<#compress >
    <#include "module/_macro.ftl">
    <@head title="Sour后台管理-个人资料"></@head>

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
                            <h1 class="m-0">个人资料</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">首页</a></li>
                                <li class="breadcrumb-item active">用户</li>
                                <li class="breadcrumb-item active">个人资料</li>
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

                        <div class="col-md-5">

                            <!-- Profile Image -->
                            <div class="card card-default card-outline">
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="profile-user-img img-fluid img-circle"
                                             src="/static/images/default.png" alt="User profile picture">
                                    </div>
                                    <h3 class="profile-username text-center">妞妞大魔王</h3>
                                    <p class="text-muted text-center">Life is fantastic.</p>


                                    <div>

                                        <p class="mb-3">
                                            <i class="fas fa-link"></i>&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                    href="https://www.nndmw.club">https://www.nndmw.club</a>
                                        </p>
                                        <p class="mb-3">
                                            <i class="far fa-envelope"></i>&nbsp;&nbsp;&nbsp;&nbsp;2541019174@qq.com
                                        </p>
                                    </div>


                                    <ul class="list-group list-group-unbordered mb-3">
                                        <li class="list-group-item">
                                            <!--<b>Followers</b> <a class="float-right">1,322</a>-->
                                            <span>累计发表了43篇文章</span>
                                        </li>
                                        <li class="list-group-item">
                                            <!--<b>Following</b> <a class="float-right">543</a>-->
                                            <span>累计创建了14个分类</span>
                                        </li>
                                        <li class="list-group-item">
                                            <!--<b>Friends</b> <a class="float-right">13,287</a>-->
                                            <span>累计创建了18个标签</span>
                                        </li>
                                        <li class="list-group-item">
                                            <!--<b>Friends</b> <a class="float-right">13,287</a>-->
                                            <span>累计获得了1条评论</span>
                                        </li>
                                    </ul>
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

                                        <!-- 基本资料 -->
                                        <li class="nav-item">
                                            <a class="nav-link active" id="basic-information-tab" data-toggle="pill"
                                               href="#basic-information" role="tab" aria-controls="basic-information"
                                               aria-selected="true">基本资料</a>
                                        </li>

                                        <!-- 密码 -->
                                        <li class="nav-item">
                                            <a class="nav-link" id="password-tab" data-toggle="pill" href="#password"
                                               role="tab" aria-controls="password" aria-selected="false">密码</a>
                                        </li>

                                    </ul>


                                </div>

                                <div class="card-body">
                                    <div class="tab-content">

                                        <!-- 基本资料 -->
                                        <div class="tab-pane fade show active" id="basic-information" role="tabpanel"
                                             aria-labelledby="basic-information-tab" aria-selected="false">
                                            <div class="form-group">
                                                <label for="userName">* 用户名：</label>
                                                <input type="text" class="form-control" id="userName">
                                            </div>
                                            <div class="form-group">
                                                <label for="displayName">* 昵称：</label>
                                                <input type="text" class="form-control" id="displayName">
                                            </div>
                                            <div class="form-group">
                                                <label for="E-mail">* 电子邮箱：</label>
                                                <input type="email" class="form-control" id="E-mail">
                                            </div>
                                            <div class="form-group">
                                                <label for="userDesc">个人说明：</label>
                                                <textarea class="form-control" rows="5" id="userDesc"
                                                          style="resize: none;"></textarea>
                                            </div>
                                            <div class="card-footer">
                                                <button type="submit" class="btn btn-primary btn-sm">保存</button>
                                            </div>
                                        </div>

                                        <!-- 密码 -->
                                        <div class="tab-pane fade" id="password" role="tabpanel"
                                             aria-labelledby="password-tab" aria-selected="true">
                                            <div class="form-group">
                                                <label for="oldPassword">* 原密码：</label>
                                                <input type="password" class="form-control" id="oldPassword">
                                            </div>
                                            <div class="form-group">
                                                <label for="newPassword">* 新密码：</label>
                                                <input type="password" class="form-control" id="newPassword">
                                            </div>
                                            <div class="form-group">
                                                <label for="confirmPassword">* 确认密码：</label>
                                                <input type="password" class="form-control" id="confirmPassword">
                                            </div>
                                            <div class="card-footer">
                                                <button type="submit" class="btn btn-primary btn-sm">确认更改</button>
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
        <!-- /.content-wrapper -->

        <!-- footer -->
        <#include "module/_footer.ftl">

    </div>
    <@footer></@footer>

</#compress>