<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${path}/css/layui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/buttons.css" type="text/css">


    <link rel="stylesheet" href="${path}/css/hero-slider-style.css">                                  <!-- Hero slider style -->
    <link rel="stylesheet" href="${path}/css/templatemo-style.css">                                   <!-- Templatemo style -->


    <link rel="stylesheet" href="${path}/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>

    <!-- Theme style  -->
    <link rel="stylesheet" href="${path}/css/style1.css">

</head>
<body>
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
<script type="text/javascript" src="../js/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>

<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;
        element.on('nav(demo)', function(elem){
            layer.msg(elem.text());
        });
    });

</script>
<br/>
<#--<div class="layui-container">-->
    <#--<div class="layui-row">-->
        <#--<div class="layui-col-md2">-->
            <#--<img alt="180*180" src="../img/b.jpg" class="img-circle" />-->
        <#--</div>-->
        <#--<div class="layui-col-md3">-->
            <#--<address> <strong><font size="4">Takeo Kanade</font></strong><br /><br />-->
                <#--h-index:131 | #Paper:662 | #Citation:93218 <br /><br />-->
                <#--<span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> Professor<br /><br />-->
                <#--<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Department of Electrical & Computer Engineering,Carnegie Mellon University<br /><br />-->
                <#--<abbr title="Phone"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 123456</address>-->
        <#--</div>-->
    <#--</div>-->
<#--</div>-->
<div class="container-fluid tm-section tm-section-2">
    <div class="row tm-media-row">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
            <img src="../img/b.jpg" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
            <div class="tm-media-text-container">
                <h3 class="tm-media-title tm-gray-text"><span id="middleScholarName">${middleScholar.name}</span></h3>
                <input type="hidden" id="middleScholarIndex" value="${middleScholar.index}"/>
                <p class="tm-media-description tm-gray-text-2">h-index:131 | #Paper:662 | #Citation:93218 <br />
                    <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> Professor<br />
                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true" id="middleScholarAff">${middleScholar.aff}</span> <br />
                    <abbr title="Phone"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 123456</address></p>
            </div>
        </div>
    </div>
</div>
<br/>
<br/>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <ul class="nav nav-tabs" id="nav_relation">
                <li class="active" id="li_cooperate">
                    <a href="#" id="a_cooperate">合作关系</a>
                </li>
                <li id="li_team">
                    <a href="#">团队关系</a>
                </li>
                <li id="li_teastu">
                    <a href="#" id="a_teastu">师生关系</a>
                </li>
                <li id="li_ref">
                    <a href="#">直接引用关系</a>
                </li>
                <li id="li_refed">
                    <a href="#">直接被引关系</a>
                </li>
                <li id="li_coRef">
                    <a href="#">共同引用关系</a>
                </li>
                <li id="li_coRefed">
                    <a href="#">共同被引关系</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
        </div>
    </div>
</div>
<div id="content">
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $.get('/cooperateRela/${middleScholar.index}/count', function (result) {
            $("svg").attr("width", 0);
            $("svg").attr("height", 0);
            $("#content").html(result);
        });
        $("#nav_relation > li").click(function (e) {

            e.preventDefault();
            $('#nav_relation > li').removeClass('active');
            $(this).addClass('active');

            var navTab = $(this).children('a').text();
            var middleScholarIndex = $("#middleScholarIndex").attr("value");
            if(navTab == '合作关系') {
                $.get('/cooperateRela/'+middleScholarIndex+'/count', function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })

            } else if(navTab == '团队关系') {
                $.get('/coTeamRela/'+middleScholarIndex, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else if(navTab == '师生关系') {
                $.get('worldMap', function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else if(navTab == '直接引用关系') {
                $.get('/reference/ref/'+middleScholarIndex, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else if(navTab == '直接被引关系') {
                $.get('/reference/refed/'+middleScholarIndex, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else if(navTab == '共同引用关系') {
                $.get('/reference/coRef/'+middleScholarIndex, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else if(navTab == '共同被引关系') {
//                $.get('partnerCountEveYear', function (result) {
//                    $("svg").attr("width", 0);
//                    $("svg").attr("height", 0);
//                    $("#content").html(result);
//                })
                $.get('/reference/coRefed/'+middleScholarIndex, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else {
                $.get('Hello.ftl', function (result) {
                    $("#content").html(result);
                })
            }
        });
    });
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