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


<style>
    .divvvvv {
        text-align: center;
        background-color: #00AFEF;
        font-size: 20px;
        padding-top: 20px;
        padding-bottom: 20px;
        color: #FFFFFF;
    }

    .divvvvv .aaaa {
        font-weight: bold;
        font-size: 18px;
        color: #E4E4E4;
    }



</style>
<div class="divvvvv">
    <h1>Advisor-advisee Relationship <span class="aaaa">Web of Scholars</span></h1>
</div>
&nbsp;
<#--<style>
    .inn{
        height:200px;
        width:300px;
        border:#00AFEF;
    }
</style>-->
<div id="influence" style="height: 50%">
    <script type="text/javascript">
        var dom = document.getElementById("influence");
        var myChart = echarts.init(dom);
        option = null;
        option = {
            backgroundColor: "#ffffff ",
            color: ['#EE7600', '#63B8FF', '#ec4863'],
            title: [{
                text: '师生影响图',
                left: '1%',
                top: '6%',

            }, {
                text: '师生合作率',
                left: '83%',
                top: '-2%',
                textAlign: 'center',

            }],
            /*title: {
                text: '师生影响图'
            },*/
            tooltip: {
                trigger: 'axis'
            },
            grid: {
                left: '10%',
                right: '35%',
                top: '16%',
                bottom: '6%',
                containLabel: true
            },
            toolbox: {
                "show": false,
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                name:'关系确立时长',
                left: '50%',
                top: '6%',
                nameTextStyle:{
                    color:"black",
                    fontSize:16,
                    padding:10
                },
                //splitLine:{show: false},
                "axisLine": {
                    lineStyle: {
                        color: '#0F0F0F'
                    }
                },
                "axisTick": {
                    "show": false
                },
                axisLabel: {
                    textStyle: {
                        color: '#0F0F0F'
                    }
                },
                boundaryGap: false,
                data: ['1', '2', '3', '4', '5', '6', '7']
            },
            yAxis: {
                //splitLine:{show: false},
                name:'论文发表数量',
                left: '100%',
                top: '80%',
                nameTextStyle:{
                    color:"black",
                    fontSize:16,
                    padding:20
                },
                "axisLine": {
                    lineStyle: {
                        color: '#0F0F0F'
                    }
                },
                "axisTick": {
                    "show": false
                },
                axisLabel: {
                    textStyle: {
                        color: '#0F0F0F'
                    }
                },
                type: 'value'
            },
            series: [{
                name: 'j treur',
                smooth: true,
                type: 'line',
                symbolSize: 8,
                symbol: 'circle',
                data: [0, 0, 1, 1, 2, 3, 3]
            }, {
                name: 'faculteit der aard en levenswetenschappen',
                smooth: true,
                type: 'line',
                symbolSize: 8,
                symbol: 'circle',
                data: [1, 1, 2, 4, 5, 5, 7]
            }, {
                name: 'richard s j tol',
                smooth: true,
                type: 'line',
                symbolSize: 8,
                symbol: 'circle',
                data: [0, 1,2, 2, 3, 5, 4]
            },
                {
                    type: 'pie',
                    center: ['83%', '53%'],
                    radius: ['25%', '30%'],
                    label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: 150,
                        name: '污染来源分析',
                        itemStyle: {
                            normal: {
                                color: '#EE7600'
                            }
                        },
                        label: {
                            normal: {
                                formatter: '{d} %',
                                textStyle: {
                                    color: '#EE7600',
                                    fontSize: 20

                                }
                            }
                        }
                    }, {
                        value: 180,
                        name: '占位',
                        tooltip: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#b04459'
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    color: '#EE7600',
                                },
                                formatter: '\nj treur'
                            }
                        }
                    }]
                },


                {
                    type: 'pie',
                    center: ['83%', '83%'],
                    radius: ['25%', '30%'],
                    label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: 435,
                        name: '污染来源分析',
                        itemStyle: {
                            normal: {
                                color: '#63B8FF'
                            }
                        },
                        label: {
                            normal: {
                                formatter: '{d} %',
                                textStyle: {
                                    color: '#63B8FF',
                                    fontSize: 20

                                }
                            }
                        }
                    }, {
                        value: 100,
                        name: '占位',
                        tooltip: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#b04459'


                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    color: '#63B8FF',
                                },
                                formatter: '\nfaculteit der aard en levenswetenschappen'
                            }
                        }
                    }]
                },
                {
                    type: 'pie',
                    center: ['83%', '23%'],
                    radius: ['25%', '30%'],
                    label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: 335,
                        name: '污染来源分析',
                        itemStyle: {
                            normal: {
                                color: '#ec4863'
                            }
                        },
                        label: {
                            normal: {
                                formatter: '{d} %',
                                textStyle: {
                                    color: '#ec4863',
                                    fontSize: 20

                                }
                            }
                        }
                    }, {
                        value: 180,
                        name: '占位',
                        tooltip: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#b04459'
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    color: '#ec4863',
                                },
                                formatter: '\nrichard s j tol'
                            }
                        }
                    }]
                },

            ]
        }
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    </script>
</div>
<div>
    <div id="tree" style="height: 550%; width: 40%; padding-left:30px;float: left;">
        <script type="text/javascript">


            var dom = document.getElementById("tree");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;


            var data = ${tea_stu_tree!""};
            //    $.get('data/asset/data/flare.json', function (data) {
            myChart.hideLoading();

            echarts.util.each(data.children, function (datum, index) {
                index % 2 === 0 && (datum.collapsed = true);
            });

            myChart.setOption(option = {
                title: {
                    text: '树状网络图'
                },
                tooltip: {
                    trigger: 'item',
                    triggerOn: 'mousemove'
                },
                series: [
                    {
                        type: 'tree',

                        data: [data],

                        top: '1%',
                        left: '7%',
                        bottom: '1%',
                        right: '20%',

                        symbolSize: 7,

                        label: {
                            normal: {
                                position: 'left',
                                verticalAlign: 'middle',
                                align: 'right',
                                fontSize: 9
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
    <div id="co_count" style="height: 650%; width: 50%; padding-right:90px;float: left;">
        <script type="text/javascript">
            var dom = document.getElementById("co_count");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;
            d = [];
            <#if cooperate?? && (cooperate?size>0)>
                <#list cooperate as cooperaters>
                d.push({"value":${cooperaters.count!}, "name":"${cooperaters.name!""}"});
                </#list>
            </#if>
            option = {
                title : {
                    text: '合作次数',
                    x:'left'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} "
                },
                calculable : true,
                series : [
                    {
                        name:'合作次数',
                        type:'pie',
                        radius : [60, 300],
                        center : ['50%', '50%'],
                        roseType : 'area',
                        label: {
                            normal: {
                                show: false,
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        lableLine: {
                            normal: {

                                show: true
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data: d

                    }
                ]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        </script>
    </div>
    <div class="clear"></div>
</div>
&nbsp;&nbsp;
<div>
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
    <div class="clear"></div>
</div>
</body>
</html>