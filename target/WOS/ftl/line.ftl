<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<body style="height: 200%; margin: 0">
<div id="container" style="height: 200%"></div>
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
    var app = {};
    option = null;
    option = {
        title: {
            text: '关联度变化'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '5%',

            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['1','2','3','4','5','6','7','8']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'邮件营销',
                type:'line',
                stack: '总量',
                data:[120, 132, 101, 134, 90, 230, 210]
            },
            {
                name:'联盟广告',
                type:'line',
                stack: '总量',
                data:[220, 182, 191, 234, 290, 330, 310]
            },
            {
                name:'视频广告',
                type:'line',
                stack: '总量',
                data:[150, 232, 201, 154, 190, 330, 410]
            },
            {
                name:'直接访问',
                type:'line',
                stack: '总量',
                data:[320, 332, 301, 334, 390, 330, 320]
            },
            {
                name:'搜索引擎',
                type:'line',
                stack: '总量',
                data:[820, 932, 901, 934, 1290, 1330, 1320]
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