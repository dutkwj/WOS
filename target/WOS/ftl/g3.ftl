<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <style type="text/css">
        #container{
            width: 300px;
            height: auto;
            min-height: 250px;/*设置最小高度*/
            max-height: 500px;/*设置最大高度*/
            overflow: hidden;/*内容超出后隐藏*/
            border: 2px solid white;
        }
    </style>
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 300%"></div>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    d = [];
    <#if cooperate?? && (cooperate?size>0)>
        <#list cooperate as cooperaters>
        d.push("${cooperaters.name!""}");
        </#list>
    </#if>
    data = [];
    <#if cooperate?? && (cooperate?size>0)>
        <#list cooperate as cooperaters>
        data.push(${cooperaters.count!});
        </#list>
    </#if>
    option = null;
    app.title = '合作次数';

    option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : d,
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'合作次数',
                type:'bar',
                barWidth: '60%',
                data:data
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</body>
</html>