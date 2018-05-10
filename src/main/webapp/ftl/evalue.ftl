<!DOCTYPE html>
<!--suppress ALL -->
<html style="height: 100%" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <title>Advisor-advisee Relationship</title>
</head>
<body style="height: 100%; margin: 0">

<script src="../js/echarts.min.js" charset="utf-8"></script>
<script src="../js/echarts-gl.min.js" charset="utf-8"></script>
<script src="../js/ecStat.min.js" charset="utf-8"></script>
<script src="../js/dataTool.min.js" charset="utf-8"></script>
<script src="../js/china.js" charset="utf-8"></script>
<script src="../js/world.js" charset="utf-8"></script>
<script src="../js/bmap.min.js" charset="utf-8"></script>
<script src="../js/simplex.js" charset="utf-8"></script>
<script src="../js/d3.v4.min.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="../css/styles.css"/>
<div>
<div id="eval" style="height: 80%; width: 60%; margin-left:20px; float: left;">
    <script type="text/javascript">
        var dom = document.getElementById("eval");
        var myChart = echarts.init(dom);
        d=[];
        d1=[];
        <#if evalue?? && (evalue?size>0)>
            <#list evalue as evalues>
            var v = [${evalues.hindex!}, ${evalues.cocount!}, ${evalues.refednum!},${evalues.papernum!}];
            d.push({"value": v, "name": "${evalues.name!""}" });
            </#list>
        </#if>
        var app = {};
        option = null;
        option = {
            tooltip: {
                trigger: 'item',
                backgroundColor : 'rgba(0,0,250,0.2)'
            },
            visualMap: {
                min: 0,
                max: 36,
                top: 500,
                left:650,
                color: ['#FFCC99', '#99CCFF'],
                calculable: true
            },
            /*visualMap: [
                {
                    top: 20,
                    left: 0,
                    right: null,
                    // 设置文本为红色
                    textStyle: {
                        color: 'yellow'
                    },
                    selectedMode: false,
                    dimension: 3,
                    categories: ['h-index', '合作次数', '论文被引次数'],
                    inRange: {
                        color: ['#62f962', 'yellow', 'red']
                    },
                    outOfRange: {
                        color: 'orange',
                    }
                }
            ],*/
            radar: {
                center:['50%','50%'],
                name: {
                    textStyle: {
                        color: '#fff',
                        backgroundColor: '#999',
                        borderRadius: 1,
                        padding: [1, 1]
                    }
                },
                indicator : [
                    { text: 'h-index', max: 20},
                    { text: 'Cooperation times', max: 50},
                    { text: 'Paper cited times', max: 200},
                    { text: 'NO.papers', max: 50}
                ]
            },
            series : (function (){
                var series = [];
                for (var i = 1; i <= 28; i++) {
                    series.push({
                        name:'评估对比',
                        type: 'radar',
                        symbol: 'none',
                        lineStyle: {
                            width: 1
                        },
                        emphasis: {
                            areaStyle: {
                                color: 'rgba(0,250,0,0.3)'
                            }
                        },
                        data:d
                    });
                }
                return series;
            })()
        };;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    </script>
</div>
<#--<div id ="compair" style="height: 100%;width:40%;margin-left:80px;float:left;"...>-->
    <#--<<script type="text/javascript">-->
    <#--var dom = document.getElementById("compair");-->
    <#--var myChart = echarts.init(dom);-->
    <#--var app = {};-->
    <#--option = null;-->
    <#--d = [];-->
    <#--<#if cooperate?? && (cooperate?size>0)>-->
        <#--<#list cooperate as cooperaters>-->
        <#--d.push({"value":${cooperaters.count!}, "name":"${cooperaters.name!""}"});-->
        <#--</#list>-->
    <#--</#if>-->
    <#--option = {-->
        <#--tooltip : {-->
            <#--trigger: 'item',-->
            <#--formatter: "{a} <br/>{b} : {c} "-->
        <#--},-->
        <#--calculable : true,-->
        <#--series : [-->
            <#--{-->
                <#--name:'合作次数',-->
                <#--type:'pie',-->
                <#--radius : [40, 200],-->
                <#--center : ['55%', '50%'],-->
                <#--roseType : 'area',-->
                <#--label: {-->
                    <#--normal: {-->
                        <#--show: false-->
                    <#--},-->
                    <#--emphasis: {-->
                        <#--show: true-->
                    <#--}-->
                <#--},-->
                <#--lableLine: {-->
                    <#--normal: {-->
                        <#--show: false-->
                    <#--},-->
                    <#--emphasis: {-->
                        <#--show: true-->
                    <#--}-->
                <#--},-->
                <#--data: d-->
            <#--}-->
        <#--]-->
    <#--};-->
    <#--if (option && typeof option === "object") {-->
        <#--myChart.setOption(option, true);-->
    <#--}-->
<#--</script>-->
<#--</div>-->
    <div id ="compair" style="height: 80%;width:30%;margin-left:80px;float:left;"...>
        <<script type="text/javascript">
        // Generate data
        var dom = document.getElementById("compair");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        d=[];
        var category = [];
        var lineData = [];
        var barData = [];
        <#if cooperate?? && (cooperate?size>0)>
            <#list cooperate as cooperaters>
            //d.push({"value":${cooperaters.count!}, "name":"${cooperaters.name!""}"});
            category.push('${cooperaters.name!""}');
            barData.push('${cooperaters.count!""}');
            lineData.push('${cooperaters.count!""}');
            </#list>
        </#if>


        // option
        option = {
            backgroundColor: '#fff',
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                    label: {
                        show: true,
                        backgroundColor: '#333'
                    }
                }
            },
            xAxis: {
                data: category,
                axisLine: {
                    lineStyle: {
                        color: '#000'
                    }
                }
            },
            yAxis: {
                splitLine: {show: false},
                axisLine: {
                    lineStyle: {
                        color: '#000'
                    }
                }
            },
            series: [{
                name: 'Cooperation times',
                type: 'bar',
                barWidth: 10,
                itemStyle: {
                    normal: {
                        barBorderRadius: 5,
                        color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#6959CD'},
                                    {offset: 1, color: '#00FFFF'}
                                ]
                        )
                    }
                },
                data: barData
            }]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    </script>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
