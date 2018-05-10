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
<div id="tr" style="width:900px; height:600px;margin-top: 100px;margin-left: 200px">
    <script type="text/javascript">


        var dom = document.getElementById("tr");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;

        var data = [];
        //var data = ${tea_stu_tree!""}
        ;
        //    $.get('data/asset/data/flare.json', function (data) {

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

                    data: [{
                        "name": "a daffertshofer",
                        "children": [{
                            "name": "vu",
                            "children": [{"name": "m p boer"}, {"name": "p a j b m huijing"}, {"name": "m a g van offenbeek"}, {"name": "s j a van gisbergen"}, {
                                "name": "j f stins"
                            }, {"name": "paul l koopman"}, {
                                "name": "g g van de bunt"
                            }, {"name": "e j baerends"}, {
                                "name": "bert steenbergen"
                            }, {
                                "name": "faculteit der aard en levenswetenschappen"
                            }, {"name": "marijtje a j duijn"}, {
                                "name": "ad w smitsman"
                            }, {"name": "r g carson"}, {
                                "name": "mark willems"
                            }, {"name": "m f bobbert"}, {
                                "name": "f m brazier"
                            }, {"name": "tom a b snijders"}, {
                                "name": "j g snijders"
                            }, {"name": "claire f michaels"}, {
                                "name": "j treur"
                            }, {"name": "h a van den berg"}, {
                                "name": "j van der kamp"
                            }, {"name": "p h g van langen"}, {
                                "name": "jaap harlaar"
                            }, {"name": "c g baan"}, {
                                "name": "a l hof"
                            }, {"name": "richard s j tol"}]
                        }, {
                            "name": "p j beek",
                            "children": [{"name": "jaap h van dieen"}, {
                                "name": "luc p j selen"
                            }]
                        }, {
                            "name": "c e peper",
                            "children": [{"name": "a a post"}, {"name": "joost c dessing"}]
                        }]
                    }],

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
