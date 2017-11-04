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

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>

<div class="layui-container" style="margin-left: 35%;margin-top: 5%">
    <img src="../img/WOS.png" alt="wos">
</div>

<div class="layui-container" style="margin-top: 5%">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md1">
        </div>
        <div class="layui-col-md8">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="text" name="title"  lay-verify="title" autocomplete="off" placeholder="学者姓名/机构名称" class="layui-input">
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-col-md3">
            <a href="http://www.bootcss.com/" class="button button-primary button-pill button-normal">搜索</a>
            <#--<a href="http://www.bootcss.com/" class="button button-primary button-pill button-normal">高级搜索</a>-->
        </div>
    </div>
</div>
<br/>
<br/>
<div class="layui-container">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md2">
        </div>
        <div class="layui-col-md9" style="border: 1px solid #eee;padding: 0">
            <ul class="nav navbar-nav">
                <li class="active" style="background-color: #eee"><a href="#">推荐学者</a></li>
                <li><a href="#">查看更多学者</a></li>
            </ul>
        </div>
    </div>
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md2">
        </div>
        <div class="layui-col-md9" style="border-left: 1px solid #eee;border-right: 1px solid #eee;border-bottom: 1px solid #eee;">
            学者1信息
        </div>
    </div>
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md2">
        </div>
        <div class="layui-col-md9" style="border-left: 1px solid #eee;border-right: 1px solid #eee;border-bottom: 1px solid #eee;">
            学者2信息
        </div>
    </div>
</div>

</body>
</html>