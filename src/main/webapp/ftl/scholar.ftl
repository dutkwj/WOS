<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>scholar</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${path}/css/layui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/buttons.css" type="text/css">


    <link rel="stylesheet" href="${path}/css/hero-slider-style.css">                                  <!-- Hero slider style -->
    <link rel="stylesheet" href="${path}/css/templatemo-style.css">                                   <!-- Templatemo style -->

    <link rel="stylesheet" href="../Font_Awesome/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/stickup.css" type="text/css">

    <link rel="stylesheet" href="${path}/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>

    <!-- Theme style  -->
    <link rel="stylesheet" href="${path}/css/style1.css">

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

<script type="text/javascript" src="/js/layui.all.js" charset="utf-8"></script>
<script src="/js/jquery.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/stickUp.min.js"></script>

<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
    jQuery(function($) {
        $(document).ready( function() {
            $('.topNav').stickUp();
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
            <img src="../img/scholarImg.png" style="width: 60%" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
            <div class="tm-media-text-container">
                <h3 class="tm-media-title tm-gray-text"><span id="middleScholarName">${middleScholar.name!""}</span></h3>
                <input type="hidden" id="middleScholarIndex" value="${middleScholar.index}"/>
                <p class="tm-media-description tm-gray-text-2">Q-index:<span id="middleScholarQindex">${middleScholar.qindex!""}</span> |
                    H-index:<span id="middleScholarHindex">${middleScholar.hindex!""}</span> | <span id="statisticalNumber"></span> <br />
                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;Affiliation: <span id="middleScholarAff">${middleScholar.aff!""}</span> <br />
                    <span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;Study field: <span id="middleScholarFieldName">${middleScholar.fieldName!""}</span></p>
            </div>
        </div>
    </div>
</div>
<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
    <button data-method="confirmTrans" class="layui-btn">配置一个透明的询问框</button>
</div>
<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Tooltip on left">Tooltip on left</button>
<br/>
<br/>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <ul class="nav nav-tabs" id="nav_relation">
                <li class="active" id="li_cooperate">
                    <a href="#" id="a_cooperate">cooperate relationship</a>
                </li>
                <li id="li_MVC">
                    <a href="#">most valuable collectors</a>
                </li>
                <li id="li_team">
                    <a href="#">team relationship</a>
                </li>
                <li id="li_teastu">
                    <a href="#">teacher students relationship</a>
                </li>
                <li id="li_ref">
                    <a href="#">direct reference relationship</a>
                </li>
                <li id="li_refed">
                    <a href="#">direct referenced relationship</a>
                </li>
                <li id="li_coRef">
                    <a href="#">common reference relationship</a>
                </li>
                <li id="li_coRefed">
                    <a href="#">common referenced relationship</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
        </div>
    </div>
</div>
<div id="content" style="height: 1000px">
</div>

<script type="text/javascript">
    $(document).ready(function () {
        <#--$.get('/cooperateRela/${middleScholar.index}/count', function (result) {-->
            <#--$("svg").attr("width", 0);-->
            <#--$("svg").attr("height", 0);-->
            <#--$("#content").html(result);-->
        <#--});-->
        $.get('/cooperate/${middleScholar.index}/directCooperate', function (result) {
            $("#content").html(result);
        });
        $("#statisticalNumber").html("Cooperator number:" + ${middleScholar.cooperateNumber!""});

        $("#nav_relation > li").click(function (e) {

            e.preventDefault();
            $('#nav_relation > li').removeClass('active');
            $(this).addClass('active');

            var navTab = $(this).children('a').text();
            var middleScholarIndex = $("#middleScholarIndex").attr("value");
            if(navTab == 'cooperate relationship') {
//                $.get('/cooperateRela/'+middleScholarIndex+'/count', function (result) {
//                    $("svg").attr("width", 0);
//                    $("svg").attr("height", 0);
//                    $("#content").html(result);
//                })
                $.get('/cooperate/'+middleScholarIndex+'/directCooperate', function (result) {
                    $("#content").html(result);
                })

            } else if(navTab == 'most valuable collectors') {
                $.get('/cooperate/'+middleScholarIndex+'/MVC', function (result) {
                    $("#content").html(result);
                })
            } else if(navTab == 'team relationship') {
//                $.get('/coTeamRela/'+middleScholarIndex, function (result) {
//                    $("svg").attr("width", 0);
//                    $("svg").attr("height", 0);
//                    $("#content").html(result);
//                })
                $.get('/team/'+middleScholarIndex, function (result) {
                    $("#content").html(result);
                })
            } else if(navTab == 'teacher students relationship') {
                //window.open("/tree/"+middleScholarIndex);
                $.get('/tree/'+middleScholarIndex, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else if(navTab == 'direct reference relationship') {
                $.get('/ref/'+middleScholarIndex, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else if(navTab == 'direct referenced relationship') {
                $.get('/refed/'+middleScholarIndex, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                })
            } else if(navTab == 'common reference relationship') {
//                $.get('/coRef/'+middleScholarIndex, function (result) {
//                    $("svg").attr("width", 0);
//                    $("svg").attr("height", 0);
//                    $("#content").html(result);
//                })
                $.get('/coRef/'+middleScholarIndex, function (result) {
                    $("#content").html(result);
                })
            } else if(navTab == 'common referenced relationship') {
//                $.get('/coRefed/'+middleScholarIndex, function (result) {
//                    $("svg").attr("width", 0);
//                    $("svg").attr("height", 0);
//                    $("#content").html(result);
//                })
                $.get('/coRefed/'+middleScholarIndex, function (result) {
                    $("#content").html(result);
                })
            }
        });
    });
</script>

</script>
<script src="../js/jquery.min.js"></script>
<script src="../js/stickUp.min.js"></script>
<script type="text/javascript" src="/js/layui.js"></script>
<script type="text/javascript">
    //initiating jQuery
    jQuery(function($) {
        $(document).ready( function() {
            //enabling stickUp on the '.navbar-wrapper' class
            $('.qqq').stickUp();
        });
    });

    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            confirmTrans: function(){
                //配置一个透明的询问框
                layer.msg('大部分参数都是可以公用的<br>合理搭配，展示不一样的风格', {
                    time: 20000, //20s后自动关闭
                    btn: ['明白了', '知道了', '哦']
                });
            }
        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });
</script>
</body>
</html>