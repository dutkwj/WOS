<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html long="en" class="no-js">
<head>
    <meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
    <title>登陆界面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css" media="all">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js" charset="utf-8"></script>


</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item"><a href="">合作关系</a></li>
    <li class="layui-nav-item"><a href="">师生关系</a></li>
    <li class="layui-nav-item"><a href="">引用关系</a></li>
</ul>
<ul class="layui-nav layui-layout-right">
    <li class="layui-nav-item">
        <a href="javascript:;">
            <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
            <康文杰></康文杰>
        </a>
        <dl class="layui-nav-child">
            <dd><a href="">基本资料</a></dd>
            <dd><a href="">安全设置</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="">退出</a></li>
</ul>
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
                <input name="logname" class="text" required lay-verify="usererror" type="text" placeholder="please input username">
            </div>
            <div class="input_outer">
                <span class="us_uer"></span>
                <input name="logpass" class="text" value="" type="password" placeholder="please input password">
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
</script>
</body>
</html>