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


<#--<style>
    .inn{
        height:200px;
        width:300px;
        border:#00AFEF;
    }
</style>-->
<div id="inf" style="width:1500px; height:500px;position:relative; top:150px; left:7px;">
    <script type="text/javascript">
        var dom = document.getElementById("inf");
        var myChart = echarts.init(dom);
        option = null;
        option = {
            backgroundColor: "#ffffff ",
            color: ['#EE7600', '#63B8FF', '#ec4863'],
            title: [ {
                text: 'Teacher-student cooperation rate',
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
                top: '19%',
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
                name:'Duration',
                left: '50%',
                top: '8%',
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
                name:'Number of papers published',
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
</body>
</html>
