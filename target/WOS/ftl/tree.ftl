<!DOCTYPE html>
<!--suppress ALL -->
<html style="height: 100%" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <title>Advisor-advisee Relationship</title>
</head>
<body style="height: 100%; margin: 0">

<script src="/js/echarts.min.js" charset="utf-8"></script>
<script src="/js/echarts-gl.min.js" charset="utf-8"></script>
<script src="/js/ecStat.min.js" charset="utf-8"></script>
<script src="/js/dataTool.min.js" charset="utf-8"></script>
<script src="/js/china.js" charset="utf-8"></script>
<script src="/js/world.js" charset="utf-8"></script>
<script src="/js/bmap.min.js" charset="utf-8"></script>
<script src="/js/simplex.js" charset="utf-8"></script>
<script src="/js/d3.v4.min.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/css/styles.css"/>
<div id="tr" style="width:900px; height:600px;margin-top: 100px;margin-left: 200px">
    <script type="text/javascript">
        var dom = document.getElementById("tr");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        var data = ${tea_stu_tree!""};

        echarts.util.each(data.children, function (datum, index) {
            index % 2 === 0 && (datum.collapsed = true);
        });

        myChart.setOption(option = {
            tooltip: {
                trigger: 'item',
                triggerOn: 'mousemove'
            },
            series: [
                {
                    type: 'tree',
                    data:[data],
                    top: '1%',
                    left: '13%',
                    bottom: '1%',
                    right: '20%',

                    symbolSize: 10,

                    label: {
                        normal: {
                            position: 'left',
                            verticalAlign: 'middle',
                            align: 'right',
                            fontSize: 15
                        }
                    },

                    leaves: {
                        label: {
                            normal: {
                                position: 'right',
                                verticalAlign: 'middle',
                                align: 'left'
                            }
                        }
                    },

                    expandAndCollapse: true,
                    animationDuration: 550,
                    animationDurationUpdate: 750
                }
            ]
        });
        //    });;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    </script>
</div>
</body>
</html>
