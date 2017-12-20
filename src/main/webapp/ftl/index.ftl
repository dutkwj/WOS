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
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css" type="text/css">

    <link rel="stylesheet" href="${path}/css/hero-slider-style.css">
    <!-- Hero slider style -->
    <link rel="stylesheet" href="${path}/css/templatemo-style.css">
    <!-- Templatemo style -->
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
            <康文杰></康文杰>
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
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<div class="banner">
    <div class="container">
        <div class="banner-info1" style="margin-left: 35%;">
            <img src="../img/WOS.png" alt="wos" >
        </div>
        <div class="layui-container">
            <form class="layui-form" action="/simpleSearch/content">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-md1">
                    </div>
                    <div class="layui-col-md8">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text" name="scholarName" lay-verify="title" autocomplete="off"
                                       placeholder="scholar name" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="layui-form-item">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="layui-btn layui-btn-normal layui-btn-radius" lay-submit="">search</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <br/>
        <div class="layui-container">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md2">
                </div>
                <div class="layui-col-md9" style="border: 1px solid #eee;padding: 0">
                    <ul class="nav navbar-nav">
                        <#if search??>
                            <li class="active" style="background-color: #eee"><a href="#">search result</a></li>
                        <#else>
                            <li class="active" style="background-color: #eee"><a href="#">recommend scholar</a></li>
                        </#if>

                        <li><a href="/searchMore/index">search more scholar</a></li>
                    </ul>
                </div>
            </div>
            <div class="layui-row layui-col-space10">
                <#if scholars?? && (scholars?size>0)>
                    <#list scholars as scholar>
                        <div class="layui-col-md2">
                        </div>
                        <div class="layui-col-md9" style="border-left: 1px solid #eee;border-right: 1px solid #eee;border-bottom: 1px solid #eee;">
                            <div class="row tm-media-row">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <img src="../img/b.jpg" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                    <div class="tm-media-text-container">
                                        <h3 class="tm-media-title tm-gray-text"><a href="/scholar/baseInfo?authorId=${scholar.index}">${scholar.name!""}</a> </h3>
                                        <p class="tm-media-description tm-gray-text-2">h-index:131 | #Paper:662 | #Citation:93218
                                            <br/>
                                            <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> Professor<br/>
                                            <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>${scholar.aff!""}<br/>
                                            <abbr title="Phone"><span class="glyphicon glyphicon-earphone"
                                                                      aria-hidden="true"></span> 123456</address></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
        </div>

        <ul id="biuuu_city_list"></ul>
        <div id="demo20" style="margin-left: 35%;margin-top: 5%"></div>


        <#--<script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>-->
        <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
        <#--<script>-->
            <#--layui.use(['laypage', 'layer'], function () {-->
                <#--var laypage = layui.laypage-->
                        <#--, layer = layui.layer;-->

                <#--//总页数大于页码总数-->
                <#--laypage.render({-->
                    <#--elem: 'demo1'-->
                    <#--, count: 70 //数据总数-->
                    <#--, jump: function (obj) {-->
                        <#--console.log(obj)-->
                    <#--}-->
                <#--});-->

                <#--//将一段数组分页展示-->

                <#--//测试数据-->
                <#--var data = [-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                    <#--'学者1信息',-->
                <#--];-->

                <#--//调用分页-->
                <#--laypage.render({-->
                    <#--elem: 'demo20'-->
                    <#--, count: data.length-->
                    <#--, jump: function (obj) {-->
                        <#--//模拟渲染-->
                        <#--document.getElementById('biuuu_city_list').innerHTML = function () {-->
                            <#--var arr = []-->
                                    <#--, thisData = data.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);-->
                            <#--layui.each(thisData, function (index, item) {-->
                                <#--arr.push('<li>' + item + '</li>');-->
                            <#--});-->
                            <#--return arr.join('');-->
                        <#--}();-->
                    <#--}-->
                <#--});-->

            <#--});-->
        <#--</script>-->
        <#--<div class="container-fluid tm-section tm-section-2">-->
            <#--<div class="row tm-media-row">-->
                <#--<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">-->
                    <#--<img src="img/b.jpg" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">-->
                <#--</div>-->
                <#--<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">-->
                    <#--<div class="tm-media-text-container">-->
                        <#--<h3 class="tm-media-title tm-gray-text">Takeo Kanade</h3>-->
                        <#--<p class="tm-media-description tm-gray-text-2">h-index:131 | #Paper:662 | #Citation:93218-->
                            <#--<br/>-->
                            <#--<span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> Professor<br/>-->
                            <#--<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Department of-->
                            <#--Electrical & Computer Engineering,Carnegie Mellon University<br/>-->
                            <#--<abbr title="Phone"><span class="glyphicon glyphicon-earphone"-->
                                                      <#--aria-hidden="true"></span> 123456</address></p>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</div>-->
        <#--</div>-->
    </div>
</div>
</body>
</html>