<!doctype html>
<html lang="zh">
<head>

    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>
</head>
<body>
<div class="" id="scholar_list">
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

                        var areas = thisData[6][index].split(';');

                        var result='';
                        var len = areas.length;
                        if(len > 4){
                            len = 4;
                        }
                        for(var i = 0 ;i< len;i++){
                            var cnt = 0;
                            if(areas[i] !== null && areas[i] !== undefined && areas[i] !== ''){
                                result += '<span>';
                                result += areas[i];
                                result += '</span>';
                                cnt++;
                            }
                            if(cnt!=len && len!=4){
                                result += '<span>';
                                result += "no information";
                                result += '</span>';
                            }
                        }

                        arr.push('<div class="profile-content">'+
                                '<div class="card">'+
                                '<div class="firstinfo">'+
                                '<img src="/img/images/users/scholarImg.png"  alt="" class="img-circle img-responsive" />'+
                                '<div class="profileinfo">'+
                                '<h1><a href="/scholar/baseInfo?authorId=' + thisData[0][index] + '">' + thisData[1][index] +  '</a></h1>'+
                                '<h4>P-index:' + thisData[3][index]+ ' ' + 'Hindex:' + thisData[2][index] + '  ' + temp + '</h4>'+
                                '<p class="bio">'+
                                'Afliation: '+ thisData[5][index] +'</p>'+
                                '<div class="profile-skills">'+ result +
                                '</div>'+
                                '<div class="hire-btn">'+
                                '<a href="graph.html" class="btn-default" > <i class="fa fa-location-arrow"></i> Relation</a>'+
                                '</div>'+
                                '</div>'+
                                '</div>'+
                                '</div>'+
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