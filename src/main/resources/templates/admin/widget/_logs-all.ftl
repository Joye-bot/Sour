<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sour后台管理-所有日志</title>
    <link rel="stylesheet" href="/static/css/adminlte.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
</head>
<body>

<div class="container-fluid">

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12" style="top: 15px;">
                    <div class="card">
                        <div class="card-body table-responsive p-0">
                            <table class="table table-head-fixed text-nowrap">
                                <thead>
                                <tr>
                                    <th>日志编号</th>
                                    <th>触发事件</th>
                                    <th>产生结果</th>
                                    <th>IP</th>
                                    <th>产生时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list logs.content as log>
                                <tr>
                                    <td>${log.logId}</td>
                                    <td>${log.logTitle}</td>
                                    <td>${log.logContent}</td>
                                    <td>${log.logIp}</td>
                                    <td>${log.logCreated}</td>
                                </tr>
                                </#list>
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

</div>

<script src="/static/plugins/jquery/jquery.min.js"></script>
<script src="/static/js/adminlte.min.js"></script>
<script src="/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
