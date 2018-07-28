<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--suppress ALL -->
<html long="en" class="no-js" xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
    <title>show</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css" media="all">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>

    <link rel="stylesheet" href="/css/bootstrap.min.css">



    <link rel="stylesheet" href="/Font_Awesome/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/social-icons.css">



    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">




    <!-- JQUERY MENU -->
    <link rel="stylesheet" href="/css/mega_menu.min.css">


    <link rel="stylesheet" href="/css/owl.style.css">

    <link rel="stylesheet" href="/css/style.css">


    <link rel="stylesheet" href="/css/et-line-fonts.css" type="text/css">

    <!-- Google Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,900,300" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">


    <script type="text/javascript" src="/js/jquery-2.2.3.min.js"></script>

    <link href="/css/dialog/normalize.css" rel="stylesheet" type="text/css">


    <link rel="stylesheet" type="text/css" href="/css/component.css" />

    <#--<link rel="stylesheet" href="/css/dialog/jquery.gDialog.css">-->


    <#--<script src="/js/dialog/jquery.js"></script>-->
    <#--<script src="/js/dialog/jquery.gDialog.js"></script>-->

</head>
<body >

<div class="page category-page">
    <div id="spinner">
        <div class="spinner-img"> <img alt="Opportunities Preloader" src="../img/images/loader.gif" />
            <h2>Please Wait.....</h2>
        </div>
    </div>
    <header id="header2" class="navbar transparent-header fa-change-white">
        <nav id="menu-1" class="mega-menu" data-color="">
            <section class="menu-list-items">
            <#include "nav.ftl">

            </section>
        </nav>
    </header>
    <div class="clearfix"></div>
    <section class="breadcrumb-search parallex" style="padding: 40px 0;">

    </section>
    <section class="login-page light-blue">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="login-container">
                        <div class="loginbox" id="large-header">
                            <div class="loginbox-title">modify Password </div>
                        <#--<ul class="social-network social-circle onwhite">-->
                        <#--<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>-->
                        <#--<li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>-->
                        <#--<li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>-->
                        <#--<li><a href="#" class="icoLinkedin" title="Linkedin +"><i class="fa fa-linkedin"></i></a></li>-->
                        <#--</ul>-->
                            <div class="loginbox-or">
                                <div class="or-line"></div>
                            <#--<div class="or">OR</div>-->
                            </div>

                            <form class="layui-form" action="/modifyPsw/modify" name="f" method="post" id="login_form">
                                <div class="form-group">
                                    <label>password: <span class="required">*</span></label>
                                <#--<input placeholder="" class="form-control" type="email" name="email">-->
                                    <input name="password" class="form-control" id="password" required lay-verify="password" type="password"  placeholder="please input password" style="text-transform: none;">
                                    <#--<input name="password" class="text" id="password" required lay-verify="password" type="password" value="" placeholder="please input password">-->
                                </div>
                                <div class="form-group">
                                    <label>confirm the password: <span class="required">*</span></label>

                                    <input name="confirm_the_password" class="form-control" value="" id="repass" type="password" placeholder="please confirm the password" style="text-transform: none;">
                                    <#--<input name="confirm_the_password" class="text" id="repass" required lay-verify="repass" value="" type="password" placeholder="please confirm the password">-->
                                </div>

                                <div class="loginbox-submit">
                                    <input type="submit" class="btn btn-default btn-block" value="modify" onclick="submitForm()"  id="submit">
                                </div>
                                <#--<div class="mb2"><a lay-submit class="act-but submit" href="javascript:;" id="submit" >modify</a></div>-->
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<#--<div id="large-header" class="large-header">-->
    <#--<div class="logo_box">-->
        <#--<h1 ><img src="../img/web_of_scholar.png" alt="wos" width="400" height="62"></h1>-->
        <#--<form class="layui-form" action="/modifyPsw/modify" name="f" method="post" id="login_form">-->
        <#--&lt;#&ndash;<input type="text" name="email" required  lay-verify="email" placeholder="please input email" autocomplete="off" class="layui-input">&ndash;&gt;-->

            <#--<div class="input_outer">-->
                <#--<span class="u_user"></span>-->
                <#--<input name="password" class="text" id="password" required lay-verify="password" type="password" value="" placeholder="please input password">-->
            <#--</div>-->
            <#--<div class="input_outer">-->
                <#--<span class="us_uer"></span>-->
                <#--<input name="confirm_the_password" class="text" id="repass" required lay-verify="repass" value="" type="password" placeholder="please confirm the password">-->
            <#--</div>-->
            <#--<div class="mb2"><a lay-submit class="act-but submit" href="javascript:;" id="submit" >modify</a></div>-->
        <#--</form>-->
    <#--</div>-->
<#--</div>-->

<script src="/js/jquery.backstretch.min.js"></script>
<script src="/js/jquery.tweet.js"></script>
<script src="/js/jquery.prettyPhoto.js"></script>
<script src="/js/showInfo-scripts.js"></script>
<!-- BOOTSTRAP CORE JS -->
<script type="text/javascript" src="/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/custom.js"></script>
<script type="text/javascript" src="../layui/layui.all.js" charset="utf-8"></script>

<script src="/js/demo-1.js"></script>
<#--<div style="text-align:center;">-->
<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>



<script type="text/javascript">
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

</body>
</html>


<#--============-->
<#--<#assign path="${request.getContextPath()}">-->
<#--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->

<#--<html long="en" class="no-js">-->
<#--<head>-->
    <#--<meta http-equiv="Content-Type"content="text/html; charset=UTF-8">-->
    <#--<title>修改密码界面</title>-->
    <#--<meta name="viewport" content="width=device-width,initial-scale=1">-->
    <#--<link rel="stylesheet" type="text/css" href="../css/component.css" />-->
    <#--<link rel="stylesheet" href="../layui/css/layui.css" type="text/css" media="all">-->

    <#--<link href="../css/dialog/normalize.css" rel="stylesheet" type="text/css">-->
    <#--<link rel="stylesheet" href="../css/dialog/animate.min.css">-->
    <#--<link rel="stylesheet" href="../css/dialog/jquery.gDialog.css">-->

    <#--<script type="text/javascript" src="../js/jquery-3.2.1.min.js" charset="utf-8"></script>-->
    <#--<script src="../js/dialog/jquery.js"></script>-->
    <#--<script src="../js/dialog/jquery.gDialog.js"></script>-->

<#--</head>-->
<#--<body>-->
<#--<div class="topNav" style="z-index: 15; margin: 0px; position: fixed; top: 0px;width: 100%">-->
    <#--<ul class="layui-nav">-->
        <#--<a href="/index"><img src="../img/wos_index.png" alt="" style="height: 60px"/></a>-->
    <#--</ul>-->
    <#--<ul class="layui-nav layui-layout-right">-->
    <#--<#if Session.user?exists>-->
        <#--<li class="layui-nav-item">-->
            <#--<a href="javascript:;">-->
                <#--<img src="/hdfs/personalPhoto" class="layui-nav-img">-->
            <#--${Session['user'].name!""}-->
            <#--</a>-->
            <#--<dl class="layui-nav-child">-->
                <#--<dd><a href="/showPersonalInfo/getUserInfo">base information</a></dd>-->
                <#--<dd><a href="/modifyPsw/modifyPage">modify information</a></dd>-->
            <#--</dl>-->
        <#--</li>-->
        <#--<li class="layui-nav-item"><a href="/logout">logout</a></li>-->
    <#--<#else>-->
        <#--<li class="layui-nav-item"><a href="/login/index">login</a></li>-->
        <#--<li class="layui-nav-item"><a href="/register/index">register</a></li>-->
    <#--</#if>-->
    <#--</ul>-->
<#--</div>-->
<#--<script type="text/javascript" src="../layui/layui.all.js" charset="utf-8"></script>-->
<#--<script type="text/javascript">-->
    <#--layui.use('element', function () {-->
        <#--var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块-->

        <#--//监听导航点击-->
        <#--element.on('nav(demo)', function (elem) {-->
            <#--//console.log(elem)-->
            <#--layer.msg(elem.text());-->
        <#--});-->
    <#--});-->
<#--</script>-->
<#--<div id="large-header" class="large-header">-->
    <#--<div class="logo_box">-->
        <#--<h1 ><img src="../img/web_of_scholar.png" alt="wos" width="400" height="62"></h1>-->
        <#--<form class="layui-form" action="/modifyPsw/modify" name="f" method="post" id="login_form">-->
        <#--&lt;#&ndash;<input type="text" name="email" required  lay-verify="email" placeholder="please input email" autocomplete="off" class="layui-input">&ndash;&gt;-->

            <#--<div class="input_outer">-->
                <#--<span class="u_user"></span>-->
                <#--<input name="password" class="text" id="password" required lay-verify="password" type="password" value="" placeholder="please input password">-->
            <#--</div>-->
            <#--<div class="input_outer">-->
                <#--<span class="us_uer"></span>-->
                <#--<input name="confirm_the_password" class="text" id="repass" required lay-verify="repass" value="" type="password" placeholder="please confirm the password">-->
            <#--</div>-->
            <#--<div class="mb2"><a lay-submit class="act-but submit" href="javascript:;" id="submit" >modify</a></div>-->
        <#--</form>-->
    <#--</div>-->
<#--</div>-->
<#--&lt;#&ndash;<script src="../js/TweenLite.min.js"></script>&ndash;&gt;-->
<#--&lt;#&ndash;<script src="../js/EasePack.min.js"></script>&ndash;&gt;-->
<#--&lt;#&ndash;<script src="../js/rAF.js"></script>&ndash;&gt;-->
<#--<script src="../js/demo-1.js"></script>-->
<#--&lt;#&ndash;<div style="text-align:center;">&ndash;&gt;-->
<#--<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>-->

<#--&lt;#&ndash;<script type="text/javascript">&ndash;&gt;-->
<#--&lt;#&ndash;layui.use(['form'], function() {&ndash;&gt;-->
<#--&lt;#&ndash;var form = layui.form;&ndash;&gt;-->
<#--&lt;#&ndash;form.verify({&ndash;&gt;-->
<#--&lt;#&ndash;usererror: function (value) {&ndash;&gt;-->
<#--&lt;#&ndash;return "test error";&ndash;&gt;-->
<#--&lt;#&ndash;//            var password = document.getElementById('password').value;&ndash;&gt;-->
<#--&lt;#&ndash;//            if (!(password == value)) {&ndash;&gt;-->
<#--&lt;#&ndash;//                return "two input password must be consistent";&ndash;&gt;-->
<#--&lt;#&ndash;//            }&ndash;&gt;-->
<#--&lt;#&ndash;}&ndash;&gt;-->
<#--&lt;#&ndash;});&ndash;&gt;-->
<#--&lt;#&ndash;}&ndash;&gt;-->
<#--&lt;#&ndash;</script>&ndash;&gt;-->

<#--<script>-->
    <#--layui.use(['form', 'layedit', 'laydate'], function() {-->

        <#--var form = layui.form-->
                <#--, layer = layui.layer-->
                <#--, laydate = layui.laydate-->
                <#--, i = 0;-->

        <#--//自定义验证规则-->
        <#--form.verify({-->
            <#--repass: function (value) {-->
                <#--var password = document.getElementById('password').value;-->
                <#--if (!(password == value)) {-->
                    <#--return "two input password must be consistent";-->
                <#--}else{-->
                    <#--i = 1;-->
                <#--}-->
            <#--}-->
            <#--, required: [/[\S]+/, "must input area can't be null"]-->
            <#--, pass: [/(.+){6,12}$/, 'password length must between 6 to 12']-->
            <#--, email: [/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, "email format is not right"]-->
        <#--});-->


        <#--//监听提交-->
        <#--form.on('submit', function (data) {-->
<#--//            layer.alert(JSON.stringify(data.field), {-->
<#--//                title: '最终的提交信息'-->
<#--//            });-->
            <#--if(i==1){-->
                <#--document.getElementById("login_form").submit();-->
            <#--}-->

<#--//            return false;-->
        <#--});-->


    <#--});-->
<#--//    function submitForm(){-->
<#--//-->
<#--//        document.getElementById("login_form").submit();-->
<#--//    }-->


<#--</script>-->

<#--</script>-->
<#--<script src="../js/jquery.min.js"></script>-->
<#--<script src="../js/stickUp.min.js"></script>-->

<#--<script type="text/javascript">-->
    <#--//initiating jQuery-->
    <#--jQuery(function($) {-->
        <#--$(document).ready( function() {-->
            <#--//enabling stickUp on the '.navbar-wrapper' class-->
            <#--$('.qqq').stickUp();-->
        <#--});-->
    <#--});-->
<#--</script>-->
<#--</body>-->
<#--</html>-->