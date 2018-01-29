<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>statistical rankings</title>
    <link rel="stylesheet" href="../css/layui.css" type="text/css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/stickup.css" type="text/css">



    <style>
        .ripple {
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.4);
            -webkit-transform: scale(0);
            -ms-transform: scale(0);
            transform: scale(0);
            position: absolute;
            opacity: 1;
        }

        .rippleEffect {
            -webkit-animation: rippleDrop .6s linear;
            animation: rippleDrop .6s linear;
        }
        @-webkit-keyframes
        rippleDrop {  100% {
            -webkit-transform: scale(2);
            transform: scale(2);
            opacity: 0;
        }
        }

    </style>
</head>
<body>
<div class="topNav" style="z-index: 15; margin: 0px; position: fixed; top: 0px;width: 100%">
    <ul class="layui-nav" style="margin: 0;">
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

    <div style="height: 70px;background: white;z-index: 15;margin: 0;padding: 0"></div>
<#--<div class="navbar-wrapper" style="z-index: 15;margin: 0">-->
    <div class="navwrapper" style="margin-left:8%;">
        <div class="navbar navbar-inverse navbar-static-top" style="width: 1550px;">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="font-size: 20px">rank items</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="menuItem active" style="font-size: 17px"><a href="#">cooperator number<span class="glyphicon glyphicon-arrow-down"></span></a></li>
                    <li class="menuItem" style="font-size: 17px"><a href="#">team members<span class="glyphicon glyphicon-arrow-down"></span></a></li>
                    <li class="menuItem" style="font-size: 17px"><a href="#">students number<span class="glyphicon glyphicon-arrow-down"></span></a></li>
                    <li class="menuItem" style="font-size: 17px"><a href="#">reference number<span class="glyphicon glyphicon-arrow-down"></span></a></li>
                    <li class="menuItem" style="font-size: 17px"><a href="#">referenced number<span class="glyphicon glyphicon-arrow-down"></span></a></li>
                    <li class="menuItem" style="font-size: 17px"><a href="#">common reference number<span class="glyphicon glyphicon-arrow-down"></span></a></li>
                    <li class="menuItem" style="font-size: 17px"><a href="#">common referenced number<span class="glyphicon glyphicon-arrow-down"></span></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/stickUp.min.js"></script>

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
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

<div class="layui-container" id="scholar_list">
</div>
<br/>
<div class="layui-container">
    <div class="row tm-media-row">
        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
        </div>
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7">
            <div id="page"></div>

        </div>
    </div>
</div>
<br/>
<br/>
<br/>

<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>

<script>
    $("ul li").click(function (e) {
        $('.active').attr('class', 'menuItem');
        $(this).attr('class', 'menuItem active');
        if ($(this).hasClass('slider')) {
            return;
        }
        var whatTab = $(this).index();
        var howFar = 180 * whatTab;
        $(".slider").css({
            left: howFar + "px"
        });
        $(".ripple").remove();
        var posX = $(this).offset().left,
                posY = $(this).offset().top,
                buttonWidth = $(this).width(),
                buttonHeight = $(this).height();
        $(this).prepend("<span class='ripple'></span>");
        if (buttonWidth >= buttonHeight) {
            buttonHeight = buttonWidth;
        } else {
            buttonWidth = buttonHeight;
        }
        var x = e.pageX - posX - buttonWidth / 2;
        var y = e.pageY - posY - buttonHeight / 2;
        $(".ripple").css({
            width: buttonWidth,
            height: buttonHeight,
            top: y + 'px',
            left: x + 'px'
        }).addClass("rippleEffect");
        $.ajax({
            url:"/rank/top100?type=" + $(this).text(),
            success:function (result) {
                $("#scholar_list").html(result)
            }
        });
    });


    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
                ,layer = layui.layer;

        var name = [];
        var hindex = [];
        var number = [];
        var aff = [];
        var id = [];
        var fieldName = [];
    <#if scholars?? && (scholars?size>0)>
        <#list scholars as scholar>
            id.push("${scholar.index!""}");
            name.push("${scholar.name!""}");
            hindex.push("${scholar.hindex!""}");
            number.push("${scholar.cooperateNumber!""}");
            aff.push("${scholar.aff!""}");
            fieldName.push("${scholar.fieldName!""}");
        </#list>
    </#if>
        laypage.render({
            elem: 'page'
            ,count: id.length
            ,prev:'prev page'
            ,next:'next page'
            ,limit: 5
            ,jump: function(obj){
                //模拟渲染
                document.getElementById('scholar_list').innerHTML = function(){
                    var arr = [];
                    var thisData = [];
                    var subId = id.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subName = name.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subHindex = hindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subNumber = number.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subAff = aff.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subFieldName = fieldName.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);

                    thisData.push(subId);
                    thisData.push(subName);
                    thisData.push(subHindex);
                    thisData.push(subNumber);
                    thisData.push(subAff);
                    thisData.push(subFieldName);

                    layui.each(subId, function(index, item){
                        arr.push('<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;border-width: 1px">' +
                                '<div class="row tm-media-row">' +
                                '<div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">' +
                                '</div>' +
                                '<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">' +
                                '<img src="../img/scholarImg.png" style="width: 70%" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">' +
                                '</div>' +
                                '<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">' +
                                '<div class="tm-media-text-container">' +
                                '<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/scholar/baseInfo?authorId=' + thisData[0][index] + '">' + thisData[1][index] + '</a></h3>' +
                                '<p class="tm-media-description tm-gray-text-2">Q-index: | H-index:' + thisData[2][index] + ' | Cooperator number:' + thisData[3][index] +
                                '<br/>' +
                                '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;Affiliation: ' + thisData[4][index] + '<br/>' +
                                '<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;Study field: ' + thisData[5][index] + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</fieldset>');
                    });
                    return arr.join('');
                }();
            }
        });
    });

    jQuery(function($) {
        $(document).ready( function() {
//            $('.navDiv').stickUp();
//            $('.topNav').stickUp();
//            $('.navbar-wrapper').stickUp();
        });
    });
</script>

</body>
</html>