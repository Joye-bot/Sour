<#macro head title="" description="">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>${title!"Anatole"}</title>
        <meta name="author" content="${user.userDisplayName!}">
        <meta name="description" content="${description!"Anatole"}">
        <link rel="shortcut icon" href="/Anatole/source/images/favicon.png" type="image/x-icon">
        <link rel="stylesheet" href="/Anatole/source/css/font-awesome.min.css">
        <link rel="stylesheet" href="/Anatole/source/css/blog_basic.css">
        <link rel="stylesheet" href="/Anatole/source/css/style.css">
    </head>
    <body>
</#macro>

<#macro footer>
    <script src="/Anatole/source/js/jquery.js"></script>
    <script src="/Anatole/source/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/Anatole/source/js/jquery.appear.js"></script>

    </body>
    </html>
</#macro>