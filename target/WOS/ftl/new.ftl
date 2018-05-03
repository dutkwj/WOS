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
    console.log(123);
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    d=[];

    <#if evalue?? && (evalue?size>0)>
        <#list evalue as evalues>
        var value = [${evalues.hindex!}, ${evalues.cocount!}, ${evalues.refednum!} ];
        d.push({"value": value, "name": "${evalues.name!""}" });
        </#list>
    </#if>
    option = null;
    option = {
        title: {
            text: '评估对比图'
        },
        tooltip: {},

        radar: {
            // shape: 'circle',
            name: {
                textStyle: {
                    color: '#fff',
                    backgroundColor: '#999',
                    borderRadius: 3,
                    padding: [3, 5]
                }
            },
            indicator: [
                { name: 'h-index', max: 50},
                { name: '合作次数', max: 5},
                { name: '论文被引次数', max: 100}
            ]
        },
        series: [{
            name: '评估对比',
            type: 'radar',
            // areaStyle: {normal: {}},
            data : d
        }]
    };

    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</body>
</html>