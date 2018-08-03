<html>
<head>
    <meta charset="utf-8">
    <title>time_map</title>
    <script src="/js/time_map/d3.v4.min.js"></script>
    <script src="https://d3js.org/d3-selection-multi.v1.min.js"></script>
    <script src="/js/time_map/topojson.v1.min.js"></script>
    <script src="/js/time_map/echarts.min.js"></script>
    <script src="/js/time_map/walden.js"></script>
    <script type="text/javascript" src="/js/time_map/d3-ForceEdgeBundling.js"></script>
    <style>


        #time_map{
            width:600px;
            height: 400px;
            margin-left: -8rem;
            float: left;
        }
        #time_map:hover{
            width:1200px;
            height: 500px;
            margin: 0 auto;
            float: left;
        }
        #time_map:hover + #timechart{
            display: none;
        }

        #timechart{
            width:800px;
            height: 400px;
            margin-top: -2rem;
            float: right;
        }

        #timechart:hover{
            width:1200px;
            height: 1000px;
            margin-top: 16rem;
            margin-left: 25rem;
            float: right;
        }
    </style>
</head>

<body>
<div id="time_map" style=" /*background: #ebe5da*/"></div>
<div id="timechart" style="/*background: #ebe5da*/" onmouseover = "func()"  onmouseout = "func1()"></div>
<script type="text/javascript">
    <!--
    function func(){
        var p = document.getElementById("time_map");
//1、采用style修改。
//      p.style.color = "red";
//2、采用类选择器className修改。
        p.style.display = "none";
    }
    function func1(){
        var p = document.getElementById("time_map");
        p.style.display = "block";
    }
    //-->
</script>
<script>
    //去掉右侧选择框的等待遮罩
    $("#waitChoose").hide();
    var middleScholar = {};
    var yearpapernumber = {};
    var yearcooperater = new Array();
    var cooperateyear = new Array();
    var paperyear = new Array();
    var coNumyear = new Array();
    var cooperateryear = {};
    var yearcooperaterid = {};
    var yearConumbers = {};
    var places={};
    var i = 0;
    var j = 0;
//    var author_location_time_value = [];
    var scholarId = "";
    var yearcooperateryear = {};
    var time_location_data=["ALL"];

    <#if scholarId??>
        scholarId = "${scholarId!""}";
    </#if>
    <#if middleScholar.latlng??>
        places[scholarId] = [Math.abs(parseFloat("${middleScholar.longitude!""}")),Math.abs(parseFloat("${middleScholar.latitude!""}"))];
//        alert(places[scholarId]);
        <#--places[scholarId] = ;-->
    <#--&lt;#&ndash;console.log(typeof ${middleScholar.longitude});&ndash;&gt;-->
    <#else>
//    places[scholarId] = [77.02, 38.54];
    places[scholarId] = [77.02, 38.54];
    </#if>

    ///其他学者位置，year存放年份或者ALL，value存放位置
    var author_location_time=[];//其他学者每年的位置
    var author_location_all=[]; ///其他学者所有的位置
    var author_location_time_value_all=[];
    <#if yearcooperater?? && (yearcooperater?size>0)>
        <#list yearcooperaterid as id>
            var author_location_time_value = [];
            <#list yearcooperater as yecooperater>
                <#if yecooperater.latlng?? && yecooperater.year == id.year>
                author_location_time_value.push([Math.abs(parseFloat("${yecooperater.longitude!""}")),Math.abs(parseFloat("${yecooperater.latitude!""}"))]);
                <#--console.log("${yecooperater.year!""}");-->
                author_location_time_value_all.push([Math.abs(parseFloat("${yecooperater.longitude!""}")),Math.abs(parseFloat("${yecooperater.latitude!""}"))]);
                </#if>
            </#list>
        author_location_time.push(
                {
                    // year:other_dirty[i].split("(")[0].split("'")[1],
                    // value:get_authorlocation(other_dirty[i])
                    year: "${id.year!""}",
                    value: author_location_time_value
                }
        );
//        console.log(author_location_time_value);

        <#--yearcooperater[i] = "${yecooperater.index!""}";-->
        <#--i = i + 1;-->
        <#--yearcooperateryear["${yecooperater.index!""}"] = ["${yecooperater.year!""}"];-->
        <#--places["${yecooperater.index!""}"] = [Math.abs(parseFloat(${yecooperater.longitude!""})),-->
            <#--Math.abs(parseFloat(${yecooperater.latitude!""}))];-->
        </#list>
    </#if>
    author_location_all = author_location_time_value_all;
//    console.log(author_location_time_value_all);
    author_location_time.push(
            {
                year:"ALL",
                value:author_location_all
            }
    )
//    console.log(author_location_all);
    <#if cooperateyear?? && (cooperateyear?size>0)>
        <#list cooperateyear as cooperateye>
            cooperateyear[j] = "${cooperateye}";
            j = j + 1 ;
            <#--console.log("${cooperateye}");-->
        </#list>
    </#if>
    var time_axis_data=["ALL"];
    var paper_number=[];
    var author_number=[];
    <#list yearpapernumber as yepapernumber>
        <#--paperyear = "${yepapernumber.year!""}";-->
        paper_number.push(["${yepapernumber.year!""}",${yepapernumber.paperNumber!""}]);
        time_axis_data.push("${yepapernumber.year!""}");
    <#--yearpapernumber["${yepapernumber.year!""}"] = ${yepapernumber.paperNumber!""};-->
        <#--console.log(${yepapernumber.year!""} + ":" + ${yepapernumber.paperNumber!""});-->
    </#list>
    <#list yearConumbers as yearco>
        author_number.push(["${yearco.year!""}",${yearco.coNumber!""}]);
        <#--coNumyear = "${yearco.year!""}";-->
        <#--yearConumbers["${yearco.year!""}"] = ${yearco.coNumber!""};-->
        <#--console.log(${yearco.year!""} + ":" + ${yearco.coNumber!""});-->
    </#list>
    var time_coauthortimes_data=[];
    var coauthor_times=[];
    <#if yearcooperaterid?? && (yearcooperaterid?size>0)>
        <#list yearcooperaterid as yearcoid>
            coauthor_times.push("${yearcoid.coId!""}".split(","));
         	time_coauthortimes_data.push("${yearcoid.year!""}");
            <#--yearcooperaterid["${id.getYear()!""}"] = "${id.getcoId()!""}";-->
            <#--console.log("${yearcoid.coId!""}");-->
        </#list>
    </#if>
</script>
<script src="/js/time_map/time_map.js"></script>
</body>

</html>