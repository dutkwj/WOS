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

    <link rel="stylesheet" href="${path}/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>

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
            康文杰
        </a>
        <dl class="layui-nav-child">
            <dd><a href="">基本资料</a></dd>
            <dd><a href="">安全设置</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="">退出</a></li>
</ul>

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
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md2">
            <img alt="140x140" src="../img/b.jpg" class="img-circle" />
        </div>
        <div class="layui-col-md3">
            <address> <strong>Takeo Kanade</strong><br /> Professor<br /> Department of Electrical & Computer Engineering,Carnegie Mellon University<br /> <abbr title="Phone">123456</address>
        </div>
    </div>
</div>
<br/>
<br/>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <ul class="nav nav-tabs" id="nav_relation">
                <li class="active" id="baseInfo">
                    <a href="#">基本信息</a>
                </li>
                <li id="li_potentail">
                    <a href="#">潜力指数</a>
                </li>
                <li id="li_turing">
                    <a href="#">图灵数</a>
                </li>
                <li id="li_cooperate">
                    <a href="#" id="a_cooperate">合作关系</a>
                </li>
                <li id="li_teastu">
                    <a href="#" id="a_teastu">师生关系</a>
                </li>
                <li id="li_ref">
                    <a href="#">引用关系</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
        </div>
    </div>
</div>
<div id="content">123</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#nav_relation > li').click(function (e) {
            e.preventDefault();
            $('#nav_relation > li').removeClass('active');
            $(this).addClass('active');

            var navTab = $(this).children('a').text();
            if(navTab == '基本信息') {
                $("svg").attr("width", 0);
                $("svg").attr("height", 0);
                $("#content").text('基本信息');
            } else if(navTab == '潜力指数') {
                $("svg").attr("width", 0);
                $("svg").attr("height", 0);
                $("#content").text('潜力指数');
            } else if(navTab == '图灵数') {
                $("svg").attr("width", 0);
                $("svg").attr("height", 0);
                $("#content").text('图灵数');
            } else if(navTab == '合作关系') {
                $.get('cooperateRela', function (result) {
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
            } else if(navTab == '引用关系') {
                $.get('partnerCountEveYear', function (result) {
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
</body>
</html>