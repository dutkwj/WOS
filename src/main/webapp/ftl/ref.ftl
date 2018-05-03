<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="/js/echarts.min.js"></script>
<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    option = null;
    myChart.showLoading();
    var URL = '/coRefJSON/${authorId!""}';
    <#if refType?? && refType=='coRefed'>
        URL = '/coRefedJSON/${authorId}';
    </#if>
    $.getJSON(URL, function (webkitDep) {
        myChart.hideLoading();

        option = {
//            legend: {
//                data: ['HTMLElement', 'WebGL', 'SVG', 'CSS', 'Other']
//            },
            tooltip: {},
            series: [{
                type: 'graph',
                layout: 'force',
                animation: false,
                label: {
                    normal: {
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                draggable: true,
                data: webkitDep.nodes.map(function (node, idx) {
                    var v = String(node.value);
                    console.log(typeof v);
                    return {
                        id:node.id,
                        name:node.name,
                        symbolSize: node.size,
                        itemStyle: {
                            normal: {
                                color: node.color
//                                opacity: node.size > 10? 1: 0.2
                            }
                        },
                        label : {
                            normal: {
                                show: node.size > 10,
                                color:'black'
                            }
                        },
                        value:node.size
                    };
                }),
//                categories: webkitDep.categories,
                force: {
                    // initLayout: 'circular'
                    // repulsion: 20,
                    edgeLength: 20,
                    repulsion: 100,
                    gravity: 0.2
                },
                edges:webkitDep.links.map(function (link) {
                    return {
                        source: link.source,
                        target: link.target,
                        lineStyle: {
                            normal: {
                                width: link.coCount,
                                curveness: 0.2
//                                opacity: link.coCount > 8? 1: 0.2
                            }
                        }
                    };
                }),
                focusNodeAdjacency: true
            }]
        };
        myChart.setOption(option);
    });
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</body>
</html>