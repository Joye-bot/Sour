<#macro head title="">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${title!"Sour后台管理"}</title>
        <!-- Theme style-->
        <link rel="stylesheet" href="/static/css/adminlte.min.css">
        <!-- pace -->
        <link rel="stylesheet" href="/static/plugins/pace/loading-bar.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="/static/plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- jQuery -->
        <script src="/static/plugins/jquery/jquery.min.js"></script>
    </head>
    <body class="hold-transition sidebar-mini ${options.admin_layout!''} ${options.sidebar_style!''}">
</#macro>

<#macro footer>
    <!-- adminlte -->
    <script src="/static/js/adminlte.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- pace -->
    <script src="/static/plugins/pace/pace.min.js"></script>

<#if options.admin_pjax!"true" == "true">
    <script src="/static/plugins/pjax/jquery.pjax.js"></script>
</#if>

<@compress single_line=true>
    <script>
        $(document).ajaxStart(function () {
            Pace.restart();
        });
        <#if options.admin_pjax!"true" == "true">
        $(document).pjax('a[data-pjax=true]', '.content-wrapper', {fragment: '.content-wrapper', timeout: 8000});
        </#if>
        $(function () {
            if ($(window).width() < 1024) {
                if ($('body').hasClass('layout-boxed')) {
                    $('body').removeClass('layout-boxed');
                }
                if ($('body').hasClass('sidebar-collapse')) {
                    $('body').removeClass('sidebar-collapse');
                }
            }
        })
    </script>
</@compress>

    </body>
    </html>
</#macro>