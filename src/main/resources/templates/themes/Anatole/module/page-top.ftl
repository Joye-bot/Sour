<div class="page-top animated fadeInDown">
    <div class="nav">
        <@commonTag method="menus">
            <#list menus?sort_by('menuSort') as menu>
                <li>
                    <a href="${menu.menuUrl}">${menu.menuName}</a>
                </li>
            </#list>
        </@commonTag>
        <!--
        <li>
            <a class="current" href="#">Home</a>
        </li>
        <li>
            <a href="#">About</a>
        </li>
        <li>
            <a href="#">Archive</a>
        </li>
        <li>
            <a href="#">Links</a>
        </li>
        -->
    </div>

    <div class="information">
        <div class="back_btn">
            <!--
            <li>
                <a class="fa fa-chevron-left" onclick="window.history.go(-1)" style="display: none;"></a>
            </li>
            -->

            <div class="avatar">
                <img src="${options.blog_logo!"/Anatole/source/images/logo@2x.png"}" alt="">
            </div>
        </div>
    </div>
</div>