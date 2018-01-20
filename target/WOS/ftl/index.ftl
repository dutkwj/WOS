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

    <link rel="stylesheet" href="${path}/css/templatemo-style.css">

</head>
<body>
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


<#--<script type="text/javascript" src="../js/layui.js" charset="utf-8"></script>-->
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
                            <button class="layui-btn layui-btn-radius" lay-submit="">search</button>
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
            <div class="layui-row layui-col-space10" id="scholar_list">
            </div>
            <br/>

            <div class="layui-row layui-col-space10">
                <div class="layui-col-md5">
                </div>
                <div class="layui-col-md7">
                    <div id="page"></div>
                </div>
            </div>
            <br/>
            <br/>
            <br/>

        </div>

    </div>
</div>

<script>
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
                ,layer = layui.layer;

        var name = [];
        var hindex = [];
        var aff = [];
        var id = [];
        var fieldName = [];
        <#if scholars?? && (scholars?size>0)>
            <#list scholars as scholar>
                id.push("${scholar.index!""}");
                name.push("${scholar.name!""}");
                hindex.push("${scholar.hindex!""}");
                aff.push("${scholar.aff!""}");
                fieldName.push("${scholar.fieldName!""}");
            </#list>
        </#if>

        //调用分页
        laypage.render({
            elem: 'page'
            ,count: id.length
            ,limit: 5
            ,jump: function(obj){
                //模拟渲染
                document.getElementById('scholar_list').innerHTML = function(){
                    var arr = [];
                    var thisData = [];
                    var subId = id.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subName = name.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subAff = aff.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subFieldName = fieldName.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subHindex = hindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    thisData.push(subId);
                    thisData.push(subName);
                    thisData.push(subHindex);
                    thisData.push(subAff);
                    thisData.push(subFieldName);
                    layui.each(subId, function(index, item){
//                        arr.push('<li>'+ item +'</li>');
                        arr.push('<div class="layui-col-md2">' +
                                '</div>' +
                                '<div class="layui-col-md9" style="border-left: 1px solid #eee;border-right: 1px solid #eee;border-bottom: 1px solid #eee;">' +
                                    '<div class="row tm-media-row">' +
                                        '<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">' +
                                            '<img src="../img/b.jpg" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">' +
                                        '</div>' +
                                        '<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">' +
                                             '<div class="tm-media-text-container">' +
                                            '<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/scholar/baseInfo?authorId=' + thisData[0][index] + '">' + thisData[1][index] + '</a> </h3>' +
                                            '<p class="tm-media-description tm-gray-text-2">h-index:' + thisData[2][index] + ' | #Paper:662 | #Citation:93218' +
                                            '<br/>' +
                                            '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;' + thisData[3][index] + '<br/>' +
                                            '<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;' + thisData[4][index] + '</p>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>');
                    });
                    return arr.join('');
                }();
            }
        });

    });
</script>
</body>
</html>