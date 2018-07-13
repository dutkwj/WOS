<!doctype html>
<html lang="zh">
<head>
</head>
<body>

<div class="" id="scholar_list">
</div>
<div class="layui-container" id="page-container">
    <div class="">
        <div class="col-xs-0 col-sm-2 col-md-2 col-lg-2">
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

                        var areas = thisData[5][index].split(';');

                        var result='';
                        var len = areas.length;

                        for(var i = 0 ;i< len;i++){

                            if(areas[i] !== null && areas[i] !== undefined && areas[i] !== ''){
                                result += '<span>';
                                result += areas[i];
                                result += '</span>';
                            }
//                            if(i%4==0 && i!=0){
//                                result += '</br>';
//                                result += '</br>';
//                            }

                        }


                        arr.push('<div class="profile-content">'+
                                '                            <div class="card">'+
                                '                                <div class="firstinfo">'+
                                '                                    <img src="/img/images/users/scholarImg.png"  alt="" class="img-circle img-responsive" />'+
                                '                                    <div class="profileinfo">'+
                                '                                        <h1> <a style="text-decoration: none" href="/relationGraph/' + thisData[0][index] + '/directCooperate">' + thisData[1][index] + '</a></h1>'+
                                '                                        <h4>P-index:'+thisData[3][index] +'|Hindex:'+thisData[2][index]+'</h4>'+
                                '                                        <p class="bio">'+
                                '                                            Afliation: '+ thisData[4][index] +
                                '                                            </p>'+
                                '                                        <div class="profile-skills">'+result+
                                '                                        </div>'+
                                '                                        <div class="hire-btn">'+
                                '                                            <a href="graph.html" class="btn-default" > <i class="fa fa-location-arrow"></i> Relation</a>'+
                                '                                        </div>'+
                                '                                    </div>'+
                                '                                </div>'+
                                '                            </div>'+
                                '                        </div>');
                    });
                    return arr.join('');
                }();
            }
        });
    });
</script>
</body>
</html>



<#--<!doctype html>-->
<#--<html lang="zh">-->
<#--<head>-->

    <#--<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">-->
    <#--<script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>-->
<#--</head>-->
<#--<body>-->

<#--<div class="layui-container" id="scholar_list">-->
<#--</div>-->
<#--<div class="layui-container" id="page-container">-->
    <#--<div class="row tm-media-row">-->
        <#--<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">-->
        <#--</div>-->
        <#--<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">-->
            <#--<div id="page"></div>-->
        <#--</div>-->
    <#--</div>-->
<#--</div>-->

<#--<script>-->
    <#--var scholars = new Array();-->
    <#--<#if hiddenScholars?? && (scholars?size>0)>-->
        <#--<#list scholars as scholar>-->
        <#--scholars.push({index:"${scholar.index!""}", name:"${scholar.name!""}", qindex:parseFloat("${scholar.qindex}"), hindex:parseFloat("${scholar.hindex}"), aff:"${scholar.aff!""}", fieldName:"${scholar.fieldName!""}"});-->
        <#--</#list>-->
    <#--</#if>-->


    <#--layui.use(['laypage', 'layer'], function(){-->
        <#--var laypage = layui.laypage-->
                <#--,layer = layui.layer;-->

        <#--var name = [];-->
        <#--var hindex = [];-->
        <#--var qindex = [];-->
        <#--var aff = [];-->
        <#--var fieldName = [];-->
        <#--var id = [];-->
    <#--<#if scholars?? && (scholars?size>0)>-->
        <#--<#list scholars as scholar>-->
            <#--id.push("${scholar.index!""}");-->
            <#--name.push("${scholar.name!""}");-->
            <#--hindex.push("${scholar.hindex!""}");-->
            <#--qindex.push("${scholar.qindex!""}");-->
            <#--aff.push("${scholar.aff!""}");-->
            <#--fieldName.push("${scholar.fieldName!""}");-->
        <#--</#list>-->
    <#--</#if>-->

        <#--//调用分页-->
        <#--laypage.render({-->
            <#--elem: 'page'-->
            <#--,count: id.length-->
            <#--,prev:'prev page'-->
            <#--,next:'next page'-->
            <#--,limit: 5-->
            <#--,jump: function(obj){-->
                <#--//模拟渲染-->
                <#--document.getElementById('scholar_list').innerHTML = function(){-->
                    <#--var arr = [];-->
                    <#--var thisData = [];-->
                    <#--var subId = id.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);-->
                    <#--var subName = name.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);-->
                    <#--var subHindex = hindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);-->
                    <#--var subQindex = qindex.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);-->
                    <#--var subAff = aff.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);-->
                    <#--var subFieldName = fieldName.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);-->
                    <#--thisData.push(subId);-->
                    <#--thisData.push(subName);-->
                    <#--thisData.push(subHindex);-->
                    <#--thisData.push(subQindex);-->
                    <#--thisData.push(subAff);-->
                    <#--thisData.push(subFieldName);-->



                    <#--var areas = thisData[5][index].split(';');-->

                    <#--var result='';-->
                    <#--var len = areas.length;-->
                    <#--if(len > 4){-->
                        <#--len = 4;-->
                    <#--}-->
                    <#--for(var i = 0 ;i< len;i++){-->
                        <#--var cnt = 0;-->
                        <#--if(areas[i] !== null && areas[i] !== undefined && areas[i] !== ''){-->
                            <#--result += '<span>';-->
                            <#--result += areas[i];-->
                            <#--result += '</span>';-->
                            <#--cnt++;-->
                        <#--}-->
                        <#--if(cnt!=len && len!=4){-->
                            <#--result += '<span>';-->
                            <#--result += "no information";-->
                            <#--result += '</span>';-->
                        <#--}-->
                    <#--}-->


                    <#--layui.each(subId, function(index, item){-->
                        <#--arr.push('<div class="profile-content">'+-->
                                <#--'                            <div class="card">'+-->
                                <#--'                                <div class="firstinfo">'+-->
                                <#--'                                    <img src="/img/images/users/scholarImg.png"  alt="" class="img-circle img-responsive" />'+-->
                                <#--'                                    <div class="profileinfo">'+-->
                                <#--'                                        <h1> <a style="text-decoration: none" href="/relationGraph/' + thisData[0][index] + '/directCooperate">' + thisData[1][index] + '</a></h1>'+-->
                                <#--'                                        <h4>P-index:'+thisData[3][index] +'|Hindex:'+thisData[2][index]+'</h4>'+-->
                                <#--'                                        <p class="bio">'+-->
                                <#--'                                            Afliation: '+ thisData[4][index] +-->
                                <#--'                                            </p>'+-->
                                <#--'                                        <div class="profile-skills">'+result+-->
                                <#--'                                        </div>'+-->
                                <#--'                                        <div class="hire-btn">'+-->
                                <#--'                                            <a href="graph.html" class="btn-default" > <i class="fa fa-location-arrow"></i> Relation</a>'+-->
                                <#--'                                        </div>'+-->
                                <#--'                                    </div>'+-->
                                <#--'                                </div>'+-->
                                <#--'                            </div>'+-->
                                <#--'                        </div>');-->












                    <#--});-->

                    <#--return arr.join('');-->
                <#--}();-->


            <#--}-->
        <#--});-->
    <#--});-->
<#--</script>-->

<#--</body>-->
<#--</html>-->