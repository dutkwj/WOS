<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html long="en" class="no-js">
<head>
    <meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
    <title>登陆界面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css" media="all">

    <link href="../css/dialog/normalize.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../css/dialog/animate.min.css">
    <link rel="stylesheet" href="../css/dialog/jquery.gDialog.css">

    <script type="text/javascript" src="../js/jquery-3.2.1.min.js" charset="utf-8"></script>
    <script src="../js/dialog/jquery.js"></script>
    <script src="../js/dialog/jquery.gDialog.js"></script>

</head>
<body>
<div class="topNav" style="z-index: 15; margin: 0px; position: fixed; top: 0px;width: 100%">
    <ul class="layui-nav">
        <a href="/index"><img src="../img/w1.png" alt="" style="height: 60px"/></a>
    </ul>
    <ul class="layui-nav layui-layout-right">
    <#if Session.user?exists>
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
            ${Session['user'].name!""}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">base information</a></dd>
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
<script type="text/javascript" src="../layui/layui.all.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<div id="large-header" class="large-header">
    <div class="logo_box">
            <h1 ><img src="../img/web_of_scholar.png" alt="wos" width="400" height="62"></h1>
        <form class="layui-form" action="/login/verify" name="f" method="post" id="login_form">
            <#--<input type="text" name="email" required  lay-verify="email" placeholder="please input email" autocomplete="off" class="layui-input">-->

            <div class="input_outer">
                <span class="u_user"></span>
                <input name="email" class="text" required lay-verify="usererror" type="text" placeholder="please input email">
            </div>
            <div class="input_outer">
                <span class="us_uer"></span>
                <input name="password" class="text" value="" type="password" placeholder="please input password">
            </div>
            <div class="mb2"><a lay-submit class="act-but submit" href="javascript:;" onclick="submitForm()">login</a></div>
        </form>
    </div>
</div>
<#--<script src="../js/TweenLite.min.js"></script>-->
<#--<script src="../js/EasePack.min.js"></script>-->
<#--<script src="../js/rAF.js"></script>-->
<script src="../js/demo-1.js"></script>
<#--<div style="text-align:center;">-->
<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>

<#--<script type="text/javascript">-->
<#--layui.use(['form'], function() {-->
    <#--var form = layui.form;-->
    <#--form.verify({-->
        <#--usererror: function (value) {-->
            <#--return "test error";-->
<#--//            var password = document.getElementById('password').value;-->
<#--//            if (!(password == value)) {-->
<#--//                return "two input password must be consistent";-->
<#--//            }-->
        <#--}-->
    <#--});-->
<#--}-->
<#--</script>-->

<script>
    function submitForm(){

        document.getElementById("login_form").submit();
    }
    <#if loginerror??>
    $.gDialog.alert("${loginerror}", {
        title: "Login Error",
        animateIn: "bounceIn",
        animateOut: "bounceOut"
    });
    </#if>

</script>
</body>
</html>