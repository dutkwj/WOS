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
<div id="evalue" style="height: 590%; width: 40%; float: left;">
    <script type="text/javascript">
        var dom = document.getElementById("evalue");
        var myChart = echarts.init(dom);
        d=[];
        d1=[];
        <#if evalue?? && (evalue?size>0)>
            <#list evalue as evalues>
            var value = [${evalues.hindex!}, ${evalues.cocount!}, ${evalues.refednum!},${evalues.papernum!}];
            d.push({"value": value, "name": "${evalues.name!""}" });
            </#list>
        </#if>
        var app = {};
        option = null;
        option = {
            title: {
                text: '评估对比图',
                top: 10,
                left: 10
            },
            tooltip: {
                trigger: 'item',
                backgroundColor : 'rgba(0,0,250,0.2)'
            },
            visualMap: {
                min: 0,
                max: 36,
                top: 'middle',
                right: 10,
                color: ['red', 'yellow'],
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
                name: {
                    textStyle: {
                        color: '#fff',
                        backgroundColor: '#999',
                        borderRadius: 3,
                        padding: [3, 5]
                    }
                },
                indicator : [
                    { text: 'h-index', max: 20},
                    { text: '合作次数', max: 50},
                    { text: '论文被引次数', max: 200},
                    { text: '发表论文数', max: 50}
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