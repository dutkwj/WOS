<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html long="en" class="no-js">
<head>
    <meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
    <title>修改密码界面</title>
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
        <a href="/index"><img src="../img/wos_index.png" alt="" style="height: 60px"/></a>
    </ul>
    <ul class="layui-nav layui-layout-right">
    <#if Session.user?exists>
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="/hdfs/personalPhoto" class="layui-nav-img">
            ${Session['user'].name!""}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="/showPersonalInfo/getUserInfo">base information</a></dd>
                <dd><a href="/modifyPsw/modifyPage">modify information</a></dd>
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
        <form class="layui-form" action="/modifyPsw/modify" name="f" method="post" id="login_form">
        <#--<input type="text" name="email" required  lay-verify="email" placeholder="please input email" autocomplete="off" class="layui-input">-->

            <div class="input_outer">
                <span class="u_user"></span>
                <input name="password" class="text" id="password" required lay-verify="password" type="password" value="" placeholder="please input password">
            </div>
            <div class="input_outer">
                <span class="us_uer"></span>
                <input name="confirm_the_password" class="text" id="repass" required lay-verify="repass" value="" type="password" placeholder="please confirm the password">
            </div>
            <div class="mb2"><a lay-submit class="act-but submit" href="javascript:;" id="submit" >modify</a></div>
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
    layui.use(['form', 'layedit', 'laydate'], function() {

        var form = layui.form
                , layer = layui.layer
                , laydate = layui.laydate
                , i = 0;

        //自定义验证规则
        form.verify({
            repass: function (value) {
                var password = document.getElementById('password').value;
                if (!(password == value)) {
                    return "two input password must be consistent";
                }else{
                    i = 1;
                }
            }
            , required: [/[\S]+/, "must input area can't be null"]
            , pass: [/(.+){6,12}$/, 'password length must between 6 to 12']
            , email: [/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, "email format is not right"]
        });


        //监听提交
        form.on('submit', function (data) {
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            });
            if(i==1){
                document.getElementById("login_form").submit();
            }

//            return false;
        });


    });
//    function submitForm(){
//
//        document.getElementById("login_form").submit();
//    }


</script>

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