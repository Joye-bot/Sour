 <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">

        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">

            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="nav-icon fas fa-link"></i>
                </a>
            </li>

            <!-- Messages Dropdown menu-->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-envelope"></i>
                    <span class="badge badge-success navbar-badge">4</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="/static/images/default.png" alt="User Avatar"
                                 class="img-size-50 mr-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Brad Diesel
                                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">Call me whenever you can...</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">查看所有评论</a>
                </div>
            </li>

            <li class="nav-item dropdown user-menu">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                    <img class="user-image" src="/static/images/default.png" alt="User Image">
                </a>
                <div class="dropdown-menu" style="left: inherit; right: 0; width: 17px;">
                    <a class="dropdown-item" tabindex="-1" href="#">个人资料</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" tabindex="-1" href="/admin/logOut">退出登录</a>
                </div>
            </li>

        </ul>
    </nav>
    <!-- /.navbar -->