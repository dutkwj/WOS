<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>scholar rank</title>
    <link rel="stylesheet" href="../css/layui.css" type="text/css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>
</head>
<body>
<div class="layui-container" id="scholar_list">
</div>
<br/>
<div class="layui-container">
    <div class="row tm-media-row">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
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
        var id = [];
        var fieldName = [];
        var number = [];
    <#if scholars?? && (scholars?size>0)>
        <#list scholars as scholar>
            id.push("${scholar.index!""}");
            name.push("${scholar.name!""}");
            hindex.push("${scholar.hindex!""}");
            qindex.push("${scholar.qindex!""}");
            aff.push("${scholar.aff!""}");
            fieldName.push("${scholar.fieldName!""}");
            <#if type=='Cooperator number'>
                number.push("${scholar.cooperateNumber!""}");
                <#elseif type=='Team members'>
                    number.push("${scholar.coTeamNumber!""}");
                <#elseif type=='Students number'>
                    number.push("${scholar.studentsNumber!""}");
                <#elseif type=='Reference number'>
                    number.push("${scholar.refNumber!""}");
                <#elseif type=='Referenced number'>
                    number.push("${scholar.refedNumber!""}");
                <#elseif type=='Common reference number'>
                    number.push("${scholar.coRefNumber!""}");
                <#elseif type=='Common referenced number'>
                    number.push("${scholar.coRefedNumber!""}");
                <#elseif type=='Potential index by growthrate'>
                    number.push("${scholar.potentialgrowth!""}");
                <#elseif type=='Potential index by academicage'>
                    number.push("${scholar.academicage!""}");

            </#if>
        </#list>
    </#if>
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
                    var subHindex = hindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subQindex = qindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subNumber = number.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subAff = aff.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var subFieldName = fieldName.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    var temp = "";

                    thisData.push(subId);
                    thisData.push(subName);
                    thisData.push(subHindex);
                    thisData.push(subQindex);
                    thisData.push(subNumber);
                    thisData.push(subAff);
                    thisData.push(subFieldName);



                    layui.each(subId, function(index, item){
                        <#if type != 'Potential index'>
                            <#if type == 'Potential index by growthrate'>
                                temp = ' | ' + "Potential Growthrate:" + thisData[4][index];
                                <#elseif type == 'Potential index by academicage'>
                                    temp = ' | ' + "Academicage:" + thisData[4][index];
                                <#else>
                                    temp = ' | ' + "${type}" + ':' + thisData[4][index];
                            </#if>
                        </#if>
                        arr.push('<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;background:#ffffff">' +
                                '<div class="row tm-media-row">' +
                                '<div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">' +
                                '</div>' +
                                '<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">' +
                                '<img src="../img/scholarImg.png" style="width:70%" alt="Image" class="img-fluid img-circle img-thumbnail tm-media-img">' +
                                '</div>' +
                                '<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">' +
                                '<div class="tm-media-text-container">' +
                                '<h3 class="tm-media-title tm-gray-text"><a style="text-decoration: none" href="/scholar/baseInfo?authorId=' + thisData[0][index] + '">' + thisData[1][index] + '</a></h3>' +
                                '<p class="tm-media-description tm-gray-text-2">P-index:' + thisData[3][index] + ' | H-index:' + thisData[2][index]  + temp +
                                '<br/>' +
                                '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;Affiliation: ' + thisData[5][index] + '<br/>' +
                                '<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;Study field: ' + thisData[6][index] + '</p>' +
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