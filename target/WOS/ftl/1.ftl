<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 380%"></div>
<script src="../js/echarts.min.js" charset="utf-8"></script>
<script src="../js/echarts-gl.min.js" charset="utf-8"></script>
<script src="../js/ecStat.min.js" charset="utf-8"></script>
<script src="../js/dataTool.min.js" charset="utf-8"></script>
<script src="../js/china.js" charset="utf-8"></script>
<script src="../js/world.js" charset="utf-8"></script>
<script src="../js/bmap.min.js" charset="utf-8"></script>
<script src="../js/simplex.js" charset="utf-8"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    d=[];
    d1=[];
    <#if evalue?? && (evalue?size>0)>
        <#list evalue as evalues>
        var value = [${evalues.hindex!}, ${evalues.cocount!}, ${evalues.refednum!} ];
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
                { text: 'h-index', max: 30},
                { text: '合作次数', max: 50},
                { text: '论文被引次数', max: 200}
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
</body>
</html>