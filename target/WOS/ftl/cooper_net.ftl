<html>
<head>
    <meta charset="utf-8">
    <title>cooper_net</title>
</head>

<body>
<!-- <form style="margin-left: 20px"> -->
<input type="checkbox"  id="kaiguan" />&nbsp;鱼眼效果（力导向运动结束后使用）<br/>
<!-- <input type="radio" name="wot" id="path" value="two" checked />&nbsp;as path -->
<!-- </form> -->
<div id="d3_selectable_force_directed_graph" style="width: 960px; height: 700px;">

    <!-- <div id="d3_selectable_force_directed_graph1" style="width: 960px; height: 500px;"> -->
    <svg />
</div>
<link rel="stylesheet" type="text/css" href="/css/cooper_net/fisheye.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="/css/cooper_net/d3v4-selectable-zoomable-force-directed-graph.css"
      media="screen"/>


<script src="/js/time_map/d3.v4.min.js"></script>
<script src="/js/time_map/d3.v3.min.js"></script>
<script src="/js/time_map/d3v4-brush-lite.js"></script>
<script src="/js/time_map/force.js"></script>
<script src="/js/time_map/fisheye.js"></script>

<script>
    var svg = d3.select('#d3_selectable_force_directed_graph');
    // d3.json('data/miserables.with-ids.json', function(error, graph) {
//    d3.json('/file/force.json', function(error, graph) {
    d3.json('/MVCJSON/${scholarId!""}', function(error, graph) {
        if (!error) {
            createV4SelectableForceDirectedGraph(svg, graph,"${scholarId!""}");
//            0CAEADF1

        }else {
            console.error(error);
        }
    });

</script>

<#--<script>-->
    <#--var middleScholar = {};-->
    <#--var yearpapernumber = {};-->
    <#--var yearcooperater = new Array();-->
    <#--var cooperateyear = new Array();-->
    <#--var paperyear = new Array();-->
    <#--var coNumyear = new Array();-->
    <#--var cooperateryear = {};-->
    <#--var yearcooperaterid = {};-->
    <#--var yearConumbers = {};-->
    <#--var places={};-->
    <#--var i = 0;-->
    <#--var j = 0;-->
    <#--//    var author_location_time_value = [];-->
    <#--var scholarId = "";-->
    <#--var yearcooperateryear = {};-->
    <#--var time_location_data=["ALL"];-->

    <#--<#if scholarId??>-->
    <#--scholarId = "${scholarId!""}";-->
    <#--</#if>-->
    <#--<#if middleScholar.latlng??>-->
    <#--places[scholarId] = [Math.abs(parseFloat("${middleScholar.longitude!""}")),Math.abs(parseFloat("${middleScholar.latitude!""}"))];-->
    <#--//        alert(places[scholarId]);-->
    <#--&lt;#&ndash;places[scholarId] = ;&ndash;&gt;-->
    <#--&lt;#&ndash;&lt;#&ndash;console.log(typeof ${middleScholar.longitude});&ndash;&gt;&ndash;&gt;-->
    <#--<#else>-->
    <#--//    places[scholarId] = [77.02, 38.54];-->
    <#--places[scholarId] = [77.02, 38.54];-->
    <#--</#if>-->

    <#--///其他学者位置，year存放年份或者ALL，value存放位置-->
    <#--var author_location_time=[];//其他学者每年的位置-->
    <#--var author_location_all=[]; ///其他学者所有的位置-->
    <#--var author_location_time_value_all=[];-->
    <#--<#if yearcooperater?? && (yearcooperater?size>0)>-->
        <#--<#list yearcooperaterid as id>-->
        <#--var author_location_time_value = [];-->
            <#--<#list yearcooperater as yecooperater>-->
                <#--<#if yecooperater.latlng?? && yecooperater.year == id.year>-->
                <#--author_location_time_value.push([Math.abs(parseFloat("${yecooperater.longitude!""}")),Math.abs(parseFloat("${yecooperater.latitude!""}"))]);-->
                <#--&lt;#&ndash;console.log("${yecooperater.year!""}");&ndash;&gt;-->
                <#--author_location_time_value_all.push([Math.abs(parseFloat("${yecooperater.longitude!""}")),Math.abs(parseFloat("${yecooperater.latitude!""}"))]);-->
                <#--</#if>-->
            <#--</#list>-->
        <#--author_location_time.push(-->
                <#--{-->
                    <#--// year:other_dirty[i].split("(")[0].split("'")[1],-->
                    <#--// value:get_authorlocation(other_dirty[i])-->
                    <#--year: "${id.year!""}",-->
                    <#--value: author_location_time_value-->
                <#--}-->
        <#--);-->
        <#--//        console.log(author_location_time_value);-->

        <#--&lt;#&ndash;yearcooperater[i] = "${yecooperater.index!""}";&ndash;&gt;-->
        <#--&lt;#&ndash;i = i + 1;&ndash;&gt;-->
        <#--&lt;#&ndash;yearcooperateryear["${yecooperater.index!""}"] = ["${yecooperater.year!""}"];&ndash;&gt;-->
        <#--&lt;#&ndash;places["${yecooperater.index!""}"] = [Math.abs(parseFloat(${yecooperater.longitude!""})),&ndash;&gt;-->
        <#--&lt;#&ndash;Math.abs(parseFloat(${yecooperater.latitude!""}))];&ndash;&gt;-->
        <#--</#list>-->
    <#--</#if>-->
    <#--author_location_all = author_location_time_value_all;-->
    <#--//    console.log(author_location_time_value_all);-->
    <#--author_location_time.push(-->
            <#--{-->
                <#--year:"ALL",-->
                <#--value:author_location_all-->
            <#--}-->
    <#--)-->
    <#--//    console.log(author_location_all);-->
    <#--<#if cooperateyear?? && (cooperateyear?size>0)>-->
        <#--<#list cooperateyear as cooperateye>-->
        <#--cooperateyear[j] = "${cooperateye}";-->
        <#--j = j + 1 ;-->
        <#--&lt;#&ndash;console.log("${cooperateye}");&ndash;&gt;-->
        <#--</#list>-->
    <#--</#if>-->
    <#--var time_axis_data=["ALL"];-->
    <#--var paper_number=[];-->
    <#--var author_number=[];-->
    <#--<#list yearpapernumber as yepapernumber>-->
    <#--&lt;#&ndash;paperyear = "${yepapernumber.year!""}";&ndash;&gt;-->
    <#--paper_number.push(["${yepapernumber.year!""}",${yepapernumber.paperNumber!""}]);-->
    <#--time_axis_data.push("${yepapernumber.year!""}");-->
    <#--&lt;#&ndash;yearpapernumber["${yepapernumber.year!""}"] = ${yepapernumber.paperNumber!""};&ndash;&gt;-->
    <#--&lt;#&ndash;console.log(${yepapernumber.year!""} + ":" + ${yepapernumber.paperNumber!""});&ndash;&gt;-->
    <#--</#list>-->
    <#--<#list yearConumbers as yearco>-->
    <#--author_number.push(["${yearco.year!""}",${yearco.coNumber!""}]);-->
    <#--&lt;#&ndash;coNumyear = "${yearco.year!""}";&ndash;&gt;-->
    <#--&lt;#&ndash;yearConumbers["${yearco.year!""}"] = ${yearco.coNumber!""};&ndash;&gt;-->
    <#--&lt;#&ndash;console.log(${yearco.year!""} + ":" + ${yearco.coNumber!""});&ndash;&gt;-->
    <#--</#list>-->
    <#--var time_coauthortimes_data=[];-->
    <#--var coauthor_times=[];-->
    <#--<#if yearcooperaterid?? && (yearcooperaterid?size>0)>-->
        <#--<#list yearcooperaterid as yearcoid>-->
        <#--coauthor_times.push("${yearcoid.coId!""}".split(","));-->
        <#--time_coauthortimes_data.push("${yearcoid.year!""}");-->
        <#--&lt;#&ndash;yearcooperaterid["${id.getYear()!""}"] = "${id.getcoId()!""}";&ndash;&gt;-->
        <#--&lt;#&ndash;console.log("${yearcoid.coId!""}");&ndash;&gt;-->
        <#--</#list>-->
    <#--</#if>-->
<#--</script>-->
<#--<script src="/js/time_map/time_map.js"></script>-->
</body>

</html>