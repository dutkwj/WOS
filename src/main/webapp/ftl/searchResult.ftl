<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>scholar search result</title>
    <link rel="stylesheet" href="../css/layui.css" type="text/css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>
</head>
<body>

<div class="layui-container" id="scholar_list">
</div>
<div class="layui-container" id="page-container">
    <div class="row tm-media-row">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
            <div id="page"></div>
        </div>
    </div>
</div>

<script>
    var scholars = new Array();
    <#if hiddenScholars?? && (scholars?size>0)>
        <#list scholars as scholar>
        scholars.push({index:"${scholar.index!""}", name:"${scholar.name!""}", qindex:parseFloat("${scholar.qindex}"), hindex:parseFloat("${scholar.hindex}"), aff:"${scholar.aff!""}", fieldName:"${scholar.fieldName!""}"});
        </#list>
    </#if>


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
                        arr.push('<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;background: #ffffff">' +
                                '<div class="row tm-media-row">' +
                                '<div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">' +
                                '</div>' +
                                '<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">' +
                                '<img src="../img/scholarImg.png" style="width: 70%" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">' +
                                '</div>' +
                                '<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">' +
                                '<div class="tm-media-text-container">' +
                                '<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/relationGraph/' + thisData[0][index] + '/directCooperate">' + thisData[1][index] + '</a></h3>' +
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

</body>
</html>