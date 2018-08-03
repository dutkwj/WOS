<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WOS</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/layui.css" type="text/css" media="all">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/stickup.css" type="text/css">

</head>
<body style="background-color: #ebebeb">
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

<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px;background-color: #ffffff">
    <form class="layui-form" action="/searchMore/content" style="margin-right: 10px">

        <div class="layui-form-item">
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">scholar</label>
            <div class="layui-input-block">
                <input type="text" name="scholarName" lay-verify="title" autocomplete="off" placeholder="scholar name" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">affiliation</label>
            <div class="layui-input-block">
                <input type="text" name="affName" lay-verify="title" autocomplete="off" placeholder="affiliation name" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">p-index</label>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" name="minQindex" placeholder="start" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" name="maxQindex" placeholder="end" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">h-index</label>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" name="minHindex" placeholder="start" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" name="maxHindex" placeholder="end" autocomplete="off" class="layui-input">
            </div>
        </div>

        <#--<div class="layui-form-item">-->
            <#--<label class="layui-form-label">q-index</label>-->
            <#--<div class="layui-input-inline">-->
                <#--<select name="qindex">-->
                    <#--<option value="">choose q-index range</option>-->
                    <#--<option value="0, 1">[0, 1]</option>-->
                    <#--<option value="1, 2">[1, 2]</option>-->
                    <#--<option value="2, 3">[2, 3]</option>-->
                    <#--<option value="3, 4">[3, 4]</option>-->
                    <#--<option value="4, 5">[4, 5]</option>-->
                    <#--<option value="5, 6">[5, 6]</option>-->
                    <#--<option value="6, 7">[6, 7]</option>-->
                    <#--<option value="7, 8">[7, 8]</option>-->
                    <#--<option value="8, 9">[8, 9]</option>-->
                    <#--<option value="9, 10">[9, 10]</option>-->
                    <#--<option value="10, 20">[10, 20]</option>-->
                    <#--<option value="20, 30">[20, 30]</option>-->
                    <#--<option value="30, 40">[30, 40]</option>-->
                    <#--<option value="40, 50">[40, 50]</option>-->
                    <#--<option value="50, 70">[50, 70]</option>-->
                    <#--<option value="70, 100">[70, 100]</option>-->
                    <#--<option value="100, 2000">[100, ∞]</option>-->
                <#--</select>-->
            <#--</div>-->
            <#--&lt;#&ndash;<div class="layui-form-mid layui-word-aux">此处只是演示联动排版，并未做联动交互</div>&ndash;&gt;-->
        <#--</div>-->

        <#--<div class="layui-form-item">-->
            <#--<label class="layui-form-label">h-index</label>-->
            <#--<div class="layui-input-inline">-->
                <#--<select name="hindex">-->
                    <#--<option value="">choose h-index range</option>-->
                    <#--<option value="0, 0">[0]</option>-->
                    <#--<option value="1, 1">[1]</option>-->
                    <#--<option value="2, 2">[2]</option>-->
                    <#--<option value="3, 3">[3]</option>-->
                    <#--<option value="4, 4">[4]</option>-->
                    <#--<option value="5, 5">[5]</option>-->
                    <#--<option value="6, 6">[6]</option>-->
                    <#--<option value="7, 7">[7]</option>-->
                    <#--<option value="8, 10">[8, 10]</option>-->
                    <#--<option value="11, 20">[11, 20]</option>-->
                    <#--<option value="21, 30">[21, 30]</option>-->
                    <#--<option value="31, 40">[31, 40]</option>-->
                    <#--<option value="41, 1000">[41, ∞)</option>-->
                <#--</select>-->
            <#--</div>-->
        <#--</div>-->
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">search</button>
                <button type="reset" class="layui-btn layui-btn-primary">reset</button>
            </div>
        </div>
    </form>
    </fieldset>
</div>

<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px;background-color: #ffffff">
        <form id="sort_form" class="layui-form" action="" style="margin-right: 10px">
            <div class="layui-form-item">
            </div>
        <#list scholars as scholar>
        </#list>
            <input type="hidden" id="scholarIds" name="scholarIds" value=""/>
            <div class="layui-form-item">
                <label class="layui-form-label">sort</label>
                <div class="layui-input-inline">
                    <select id="sort_item" name="sortItem">
                        <option value="q_index">p-index</option>
                        <option value="h_index">h-index</option>
                    </select>
                </div>
                <label class="layui-form-label"><a style="cursor: pointer" class="sort_type" value="up"><span class="glyphicon glyphicon-arrow-up"></span></a>&nbsp;&nbsp;&nbsp;
                    <a style="cursor: pointer" class="sort_type" value="down"><span class="glyphicon glyphicon-arrow-down"></span></a></label>
            </div>
        </form>
    </fieldset>
</div>
<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>
<div class="layui-container" id="scholar_list">
</div>
<br/>
<div class="layui-container" style="margin-left: 10%">
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

<script>
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
                ,layer = layui.layer;

        var name = [];
        var hindex = [];
        var qindex = [];
        var aff = [];
        var fieldName = [];
        var id = [];
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
                    var subQindex = qindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subAff = aff.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subFieldName = fieldName.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    thisData.push(subId);
                    thisData.push(subName);
                    thisData.push(subHindex);
                    thisData.push(subQindex);
                    thisData.push(subAff);
                    thisData.push(subFieldName);

                    layui.each(subId, function(index, item){
                        arr.push('<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;margin-left:14px;border-width: 1px">' +
                                    '<div class="row tm-media-row" style="background-color: #ffffff; width: 1140px">' +
                                        '<div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">' +
                                        '</div>' +
                                        '<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">' +
                                            '<img src="../img/scholarImg.png" style="width: 70%" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">' +
                                        '</div>' +
                                        '<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">' +
                                            '<div class="tm-media-text-container">' +
                                                '<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/relationGraph/' + thisData[0][index] + '">' + thisData[1][index] + '</a></h3>' +
                                                '<p class="tm-media-description tm-gray-text-2">P-index:' + thisData[3][index] + ' | H-index:' + thisData[2][index] +
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
</script>

</script>
<script src="/js/jquery.min.js"></script>
<script src="/js/stickUp.min.js"></script>

<script type="text/javascript">
    //initiating jQuery
    jQuery(function($) {
        $(document).ready( function() {
            //enabling stickUp on the '.navbar-wrapper' class
            $('.qqq').stickUp();
        });
    });

    var scholars = new Array();
    <#if hiddenScholars?? && (scholars?size>0)>
        <#list scholars as scholar>
            scholars.push({index:"${scholar.index!""}", name:"${scholar.name!""}", qindex:parseFloat("${scholar.qindex}"), hindex:parseFloat("${scholar.hindex}"), aff:"${scholar.aff!""}", fieldName:"${scholar.fieldName!""}"});
        </#list>
    </#if>
    $(".sort_type").on("click", function (event) {
        event.preventDefault();
        $.ajax({
            type:"POST",
            url:"/searchMore/sort/" + $("#sort_item").val() + "/" + $(this).attr("value"),
            contentType:"application/json",
            data:JSON.stringify(scholars),
            dataType:"json",
            success:function (data) {
                layui.use(['laypage', 'layer'], function(){
                    var laypage = layui.laypage,layer = layui.layer;
                    var name = [];
                    var hindex = [];
                    var qindex = [];
                    var aff = [];
                    var fieldName = [];
                    var id = [];
                    for (var i = 0; i < data.length; i++) {
                        console.log(data[i].name);
                        id.push(data[i].index);
                        name.push(data[i].name);
                        hindex.push(data[i].hindex);
                        qindex.push(data[i].qindex);
                        aff.push(data[i].aff);
                        fieldName.push(data[i].fieldName);
                    }

                    //调用分页
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
                                var subQindex = qindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                                var subAff = aff.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                                var subFieldName = fieldName.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                                thisData.push(subId);
                                thisData.push(subName);
                                thisData.push(subHindex);
                                thisData.push(subQindex);
                                thisData.push(subAff);
                                thisData.push(subFieldName);

                                layui.each(subId, function(index, item){
                                    arr.push('<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;margin-left:14px;border-width: 1px">' +
                                            '<div class="row tm-media-row" style="background-color: #ffffff; width: 1140px">' +
                                            '<div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">' +
                                            '</div>' +
                                            '<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">' +
                                            '<img src="../img/scholarImg.png" style="width: 70%" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">' +
                                            '</div>' +
                                            '<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">' +
                                            '<div class="tm-media-text-container">' +
                                            '<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/scholar/baseInfo?authorId=' + thisData[0][index] + '">' + thisData[1][index] + '</a></h3>' +
                                            '<p class="tm-media-description tm-gray-text-2">P-index:' + thisData[3][index] + ' | H-index:' + thisData[2][index] +
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
            }
        });
    });
</script>
</body>
</html>