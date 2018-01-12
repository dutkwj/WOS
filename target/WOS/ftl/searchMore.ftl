<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/layui.css" type="text/css" media="all">

    <!-- Hero slider style -->
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">

    <!-- Templatemo style -->
    <#--<script type="text/javascript" src="../js/bootstrap.min.js"></script>-->
    <#--<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>-->

    <#--<script src="../js/layui.js" charset="utf-8"></script>-->
    <script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>

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

<div class="layui-container">

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px">
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
            <label class="layui-form-label">institution</label>
            <div class="layui-input-block">
                <input type="text" name="affName" lay-verify="title" autocomplete="off" placeholder="institution name" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">nation</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-search="">
                        <option value="">China</option>
                        <option value="1">layer</option>
                        <option value="2">form</option>
                        <option value="3">layim</option>
                        <option value="4">element</option>
                        <option value="5">laytpl</option>
                        <option value="6">upload</option>
                        <option value="7">laydate</option>
                        <option value="8">laypage</option>
                        <option value="9">flow</option>
                        <option value="10">util</option>
                        <option value="11">code</option>
                        <option value="12">tree</option>
                        <option value="13">layedit</option>
                        <option value="14">nav</option>
                        <option value="15">tab</option>
                        <option value="16">table</option>
                        <option value="17">select</option>
                        <option value="18">checkbox</option>
                        <option value="19">switch</option>
                        <option value="20">radio</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">q-index</label>
            <div class="layui-input-inline">
                <select name="quiz1">
                    <option value="浙江">浙江省</option>
                    <option value="你的工号">江西省</option>
                    <option value="你最喜欢的老师">福建省</option>
                </select>
            </div>
            <#--<div class="layui-form-mid layui-word-aux">此处只是演示联动排版，并未做联动交互</div>-->
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">h-index</label>
            <div class="layui-input-inline">
                <select name="quiz1">
                    <option value="浙江">浙江省</option>
                    <option value="你的工号">江西省</option>
                    <option value="你最喜欢的老师">福建省</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">search</button>
                <button type="reset" class="layui-btn layui-btn-primary">reset</button>
            </div>
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

<script>
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
                ,layer = layui.layer;

        var name = [];
        var aff = [];
        var id = [];
    <#if scholars?? && (scholars?size>0)>
        <#list scholars as scholar>
            id.push("${scholar.index!""}");
            name.push("${scholar.name!""}");
            aff.push("${scholar.aff!""}");
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
                    thisData.push(subId);
                    thisData.push(subName);
                    thisData.push(subAff);
                    layui.each(subId, function(index, item){
//                        arr.push('<li>'+ item +'</li>');
                        arr.push('<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;border-width: 1px">' +
                                    '<div class="row tm-media-row">' +
                                        '<div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">' +
                                        '</div>' +
                                        '<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">' +
                                            '<img src="../img/b.jpg" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">' +
                                        '</div>' +
                                        '<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">' +
                                            '<div class="tm-media-text-container">' +
                                                '<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/scholar/baseInfo?authorId=' + thisData[0][index] + '">' + thisData[1][index] + '</a></h3>' +
                                                '<p class="tm-media-description tm-gray-text-2">h-index:131 | #Paper:662 | #Citation:93218' +
                                                '<br/>' +
                                                '<span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> Professor<br/>' +
                                                '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>' + thisData[2][index] + '<br/>' +
                                                '<abbr title="Phone"><span class="glyphicon glyphicon-earphone"' +
                                                'aria-hidden="true"></span> 123456</address></p>' +
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
</body>
</html>