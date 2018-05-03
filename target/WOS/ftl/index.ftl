<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>index</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${path}/css/layui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/buttons.css" type="text/css">
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/stickup.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/templatemo-style.css">

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


<div class="banner">
    <div class="container">
        <div style="margin-left:25%">
            <img src="../img/wos.png" alt="wos" >
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
                        <li><a href="/rank/index">statistical rankings</a></li>
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
        var qindex = [];
        var aff = [];
        var id = [];
        var fieldName = [];
        <#if scholars?? && (scholars?size>0)>
            <#list scholars as scholar>
                id.push("${scholar.index!""}");
                name.push("${scholar.name!""}");
                hindex.push("${scholar.hindex!""}");
                qindex.push("${scholar.qindex!""}");
                aff.push("${scholar.aff!""}");
                fieldName.push("${scholar.fieldName!""}");
            </#list>
        </#if>

        //调用分页
        laypage.render({
            elem: 'page'
            ,count: id.length
            ,limit: 5
            ,prev:'prev page'
            ,next:'next page'
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
                    var subQindex = qindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    thisData.push(subId);
                    thisData.push(subName);
                    thisData.push(subHindex);
                    thisData.push(subQindex);
                    thisData.push(subAff);
                    thisData.push(subFieldName);
                    layui.each(subId, function(index, item){
//                        arr.push('<li>'+ item +'</li>');
                        arr.push('<div class="layui-col-md2">' +
                                '</div>' +
                                '<div class="layui-col-md9" style="border-left: 1px solid #eee;border-right: 1px solid #eee;border-bottom: 1px solid #eee;">' +
                                    '<div class="row tm-media-row">' +
                                        '<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">' +
                                            '<img src="../img/scholarImg.png" style="width: 60%" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">' +
                                        '</div>' +
                                        '<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">' +
                                             '<div class="tm-media-text-container">' +
                                            //'<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/scholar/baseInfo?authorId=' + thisData[0][index] + '">' + thisData[1][index] + '</a> </h3>' +
                                            '<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/tree?scholarId='+thisData[0][index] +'">' + thisData[1][index] + '</a> </h3>' +
                                            '<p class="tm-media-description tm-gray-text-2">Q-index:' + thisData[3][index] + ' | H-index:' + thisData[2][index] +
                                            '<br/>' +
                                            '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;Affiliation: ' + thisData[4][index] + '<br/>' +
                                            '<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;Study Field: ' + thisData[5][index] + '</p>' +
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