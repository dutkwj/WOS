<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html long="en" class="no-js">
<head>
    <meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
    <title>register</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${path}/layui/css/layui.css" type="text/css" media="all">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../Font_Awesome/css/font-awesome.min.css" type="text/css">

</head>
<body >
<div class="qqq" style="width: 100%;z-index: 250">
    <ul class="layui-nav">
        <li class="layui-nav-item"><a href="">合作关系</a></li>
        <li class="layui-nav-item"><a href="">师生关系</a></li>
        <li class="layui-nav-item"><a href="">引用关系</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
    <#if Session.user?exists>
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
            ${Session['user'].name!""}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="/showPersonalInfo/getUserInfo">base information</a></dd>
                <dd><a href="">modify information</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="/logout">logout</a></li>
    <#else>
        <li class="layui-nav-item"><a href="/login/index">login</a></li>
        <li class="layui-nav-item"><a href="/register/index">register</a></li>
    </#if>
    </ul>
</div>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-xs2">
            <br/>
        </div>
        <div class="layui-col-xs10">
            <br/>
            <br/>
            <br/>

            <i class="icon-ok-sign icon-3x" style="color:#5cb85c"></i>&nbsp;&nbsp;&nbsp;&nbsp; <font size="40px" color="black">register success!&nbsp;<a href="/login/index" style="color: black;cursor: pointer">click me to login!</a></font>

        </div>
    </div>
</div>
<br/>
<br/>
<br/>


</script>
<script src="../js/jquery.min.js"></script>
<script src="../js/stickUp.min.js"></script>

<script type="text/javascript">
    //initiating jQuery
    jQuery(function($) {
        $(document).ready( function() {
            //enabling stickUp on the '.navbar-wrapper' class
            $('.qqq').stickUp();
        });
    });
</script>
</body>
</html>