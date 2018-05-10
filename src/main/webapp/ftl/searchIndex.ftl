<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/htmleaf-demo.css">
    <link rel="stylesheet" href="/css/csslider.default.css" />
    <link rel="stylesheet" href="/css/inner.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/topNavStyle.css">
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css" media="all">
    <link rel="stylesheet" href="/css/templatemo-style.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">

    <script src='/js/jquery-3.2.1.min.js'></script>
    <script src="/js/megamenu.js"></script>
    <#--<script type="text/javascript" src="/js/layui.all.js" charset="utf-8"></script>-->

    <script type="text/javascript" src="/layui/layui.all.js" charset="utf-8"></script>

    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <style type="text/css">
        span.counter { display:block; margin:10px auto; font-size:64px; font-family:'Pacifico';color:#ffffcc}
    </style>
    <style type="text/css">
        html, body {
            height: 100%;
            width: 100%;
            margin: 0;
            overflow: hidden;
        }
        #site-landing {
            position:relative;
            /*height: 1800px;*/
            /*width: 120%;*/
            background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
        }
    </style>
</head>
<body>
<div id="site-landing">
</div>

<div>
    <a href="/index"><img style="position: absolute;width: 20%;left: 20px;top: 5px;" src="/img/wos_top.png"/></a>
</div>

<div class="menu-container" style="background:none;position: absolute;top:0;left:25%;">
    <div class="menu" style="background:none">
        <ul style="font-size: 19px">
            <li style="background:none"><a href="/index" style="color:#ffffcc">Home</a></li>
            <li style="background:none"><a href="http://marioloncarek.com" style="color:#ffffcc">Relationship</a>
                <ul>
                    <li><a href="#">Cooperate</a>
                        <ul>
                            <li><a href="#">Cooperate Graph</a></li>
                            <li><a href="#">Most Valuable Collaborators</a></li>
                            <li><a href="#">Collaborators Location</a></li>
                            <li><a href="#">Collaborators Number</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Team</a>
                        <ul>
                            <li><a href="#">Strong Team</a></li>
                            <li><a href="#">Middle Team</a></li>
                            <li><a href="#">Weak Team</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Advisor-advise</a>
                        <ul>
                            <li><a href="#">Undergraduate research</a></li>
                            <li><a href="#">Masters research</a></li>
                            <li><a href="#">Funding</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Cite</a>
                        <ul>
                            <li><a href="#">direct Cite</a></li>
                            <li><a href="#">direct Cited</a></li>
                            <li><a href="#">Common Cite</a></li>
                            <li><a href="#">Common Cited</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li style="background:none"><a href="/searchMore/index" style="color:#ffffcc">Search</a>
            </li>
            <li style="background:none"><a href="/rank/index" style="color:#ffffcc">Ranking</a>
            </li>
            <#--<li style="background:none"><a href="#" style="color:#ffffcc">API</a>-->
            <#--</li>-->
        </ul>
    </div>
</div>

<div class="layui-container" style="position:absolute;top: 10%;left: 20%;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px;background-color: #ffffff;opacity: 0.6">
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
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">search</button>
                    <button type="reset" class="layui-btn layui-btn-primary">reset</button>
                </div>
            </div>
        </form>
    </fieldset>
</div>

<div class="layui-container" style="position:absolute;top: 45%;left: 20%;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px;background-color: #ffffff;opacity:0.6;">
        <form id="sort_form" class="layui-form" action="" style="margin-right: 10px">
            <div class="layui-form-item">
            </div>
        <#list scholars as scholar>
        </#list>
            <input type="hidden" id="scholarIds" name="scholarIds" value=""/>
            <div class="layui-form-item">
                <#--<label class="layui-form-label">sort</label>-->
                <#--<div class="layui-input-inline">-->
                    <#--<select id="sort_item" name="sortItem">-->
                        <#--<option value="q_index">p-index</option>-->
                        <#--<option value="h_index">h-index</option>-->
                    <#--</select>-->
                <#--</div>-->
                <label class="layui-form-label">sort</label>
                <div class="layui-input-inline" style="width: 200px">
                    <input type="radio" name="sortItem" value="q_index" title="p-index" checked="">
                    <input type="radio" name="sortItem" value="h_index" title="h-index">
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
<div class="layui-container" id="scholar_list" style="position:absolute;top: 60%;left: 20%;opacity: 0.6">

</div>
<div class="layui-container" id="page-container" style="position:absolute;left: 12%;opacity: 0.6">
    <div class="row tm-media-row">
        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
        </div>
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7">
            <div id="page"></div>
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
                        arr.push('<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;margin-left:14px;border-width: 0px">' +
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
            url:"/searchMore/sort/" + $("input:").val() + "/" + $(this).attr("value"),
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


<script src="/js/polygonizr.min.js"></script>
<script type="text/javascript">

    $("html").css("overflow", "initial");
    $("body").css("overflow", "initial");

    $("#page-container").css("top", document.body.scrollHeight + 120);
    $('#site-landing').css('height', document.body.scrollHeight + 150);

    $('#site-landing').polygonizr();

</script>



</body>
</html>