<ul class="menu-logo">
    <li>
        <a href="/index"> <img src="../img/images/temp/wos_top.png" width="220px" height="40px" alt="logo" class="img-responsive"> </a>
    </li>
</ul>
<ul class="menu-links pull-right">
<#if Session.user?exists>
    <li data-toggle="dropdown" data-hover="dropdown" id="dropdownMenu1">
        <a href="/showPersonalInfo/getUserInfo" >${Session['user'].name!""}</a>

    </li>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation"><a href="/showPersonalInfo/getUserInfo">base information</a></li>
        <li role="presentation"><a href="/modifyPsw/modifyPage">modify information</a></li>
    </ul>
    <li class="no-bg"><a href="/logout" class="p-job">logout</a></li>

<#else>
    <li><a href="/login/index">Login</a></li>
    <li class="no-bg"><a href="/register/index" class="p-job">register</a></li>
</#if>
</ul>