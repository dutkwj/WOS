<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html long="en" class="no-js">
<head>
    <meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
    <title>登陆界面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
    <link rel="stylesheet" href="${path}/css/layui.css" type="text/css">
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
<script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>
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
<#--<div class="container demo-1">-->
        <div id="large-header" class="large-header">
            <#--<canvas id="demo-canvas"></canvas>-->
            <div class="logo_box">
                <#--<h1 class="g-font-size-28--xs g-font-size-40--sm g-font-size-60--md g-color--white"> Web of Scholar</h1>-->
                    <h1 ><img src="../img/web_of_scholar.png" alt="wos" width="400" height="62"></h1>
                <form action="#" name="f" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="logname" class="text" type="text" placeholder="please input username">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="logpass" class="text" value="" type="password" placeholder="please input password">
                    </div>
                    <div class="mb2"><a class="act-but submit" href="javascript:;">login</a></div>
                </form>
            </div>
        </div>
<#--</div><!-- /container &ndash;&gt;-->
<script src="../js/TweenLite.min.js"></script>
<script src="../js/EasePack.min.js"></script>
<script src="../js/rAF.js"></script>
<script src="../js/demo-1.js"></script>
<div style="text-align:center;">
</body>
</html>