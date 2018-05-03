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
<div id="graph" style="height: 650%; width: 55%; float: left;">
    <script type="text/javascript">
        var dom = document.getElementById("graph");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        var data = ${graph!""};
        option = {
            backgroundColor: new echarts.graphic.RadialGradient(0.3, 0.3, 0.8, [{
                offset: 0,
                color: '#ffffff '
            }, {
                offset: 1,
                color: '#ffffff '
            }]),
            title:{
                text: "合作网络",
                top: "top",
                left: "left"
            },
            tooltip: {},
            animationDuration: 3000,
            animationEasingUpdate: 'quinticInOut',
            series: [{
                name: '节点',
                type: 'graph',
                layout: 'force',
                /*itemStyle: {
                    normal: {
                        color: function(params) {
                            // build a color map as your need.
                            var colorList = [
                                '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                            ];
                            return colorList[params.dataIndex]
                        }
                    }
                },*/
                force: {
                    repulsion: 450
                },
                data: data.data,
                links: data.links,
                categories:data.categories,
                focusNodeAdjacency: true,
                roam: false,
                label: {
                    normal: {

                        show: true,
                        position: 'top',

                    }
                },
                lineStyle: {
                    normal: {
                        color: 'source',
                        curveness: 0,
                        type: "solid"
                    }
                }
            }]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    </script>
</div>