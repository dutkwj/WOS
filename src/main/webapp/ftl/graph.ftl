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
<div id="gra" style="width:800px; height:800px;position:relative; top:50px; left:300px;">
    <script type="text/javascript">
        var dom = document.getElementById("gra");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;

        option = {
            backgroundColor: new echarts.graphic.RadialGradient(0.3, 0.3, 0.8, [{
                offset: 0,
                color: '#ffffff '
            }, {
                offset: 1,
                color: '#ffffff '
            }]),
            tooltip: {},
            animationDuration: 3000,
            animationEasingUpdate: 'quinticInOut',
            series: [{
                name: 'scholar',
                type: 'graph',
                layout: 'force',

                force: {
                    repulsion: 500
                },
                data: [{
                    "name": "a daffertshofer",
                    "symbolSize": 20,
                    "category": "a daffertshofer",
                    "draggable": "true"
                }, {"name": "vu", "symbolSize": 15, "category": "vu", "draggable": "true"}, {
                    "name": "m p boer",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "p a j b m huijing",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "m a g van offenbeek",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "s j a van gisbergen",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "j f stins",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "paul l koopman",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "g g van de bunt",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "e j baerends",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "bert steenbergen",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "faculteit der aard en levenswetenschappen",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "marijtje a j duijn",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "ad w smitsman",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "r g carson",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "mark willems",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "m f bobbert",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "f m brazier",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "tom a b snijders",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "j g snijders",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "claire f michaels",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "j treur",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "h a van den berg",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "j van der kamp",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "p h g van langen",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "jaap harlaar",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "c g baan",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "a l hof",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "richard s j tol",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "p j beek",
                    "symbolSize": 15,
                    "category": "p j beek",
                    "draggable": "true"
                }, {
                    "name": "jaap h van dieen",
                    "symbolSize": 10,
                    "category": "p j beek",
                    "draggable": "true"
                }, {
                    "name": "luc p j selen",
                    "symbolSize": 10,
                    "category": "p j beek",
                    "draggable": "true"
                }, {
                    "name": "c e peper",
                    "symbolSize": 15,
                    "category": "c e peper",
                    "draggable": "true"
                }, {
                    "name": "a a post",
                    "symbolSize": 10,
                    "category": "c e peper",
                    "draggable": "true"
                }, {
                    "name": "joost c dessing",
                    "symbolSize": 10,
                    "category": "c e peper",
                    "draggable": "true"
                }],
                links: [{
                    "source": "a daffertshofer",
                    "target": "vu"
                }, {
                    "source": "a daffertshofer",
                    "target": "p j beek"
                }, {
                    "source": "a daffertshofer",
                    "target": "c e peper"
                }, {
                    "source": "a daffertshofer",
                    "target": "a a post"
                }, {
                    "source": "vu",
                    "target": "m p boer"
                }, {
                    "source": "vu",
                    "target": "p a j b m huijing"
                }, {
                    "source": "vu",
                    "target": "m a g van offenbeek"
                }, {
                    "source": "vu",
                    "target": "s j a van gisbergen"
                }, {
                    "source": "vu",
                    "target": "j f stins"
                }, {
                    "source": "vu",
                    "target": "paul l koopman"
                }, {
                    "source": "vu",
                    "target": "g g van de bunt"
                }, {
                    "source": "vu",
                    "target": "e j baerends"
                }, {
                    "source": "vu",
                    "target": "bert steenbergen"
                }, {
                    "source": "vu",
                    "target": "faculteit der aard en levenswetenschappen"
                }, {
                    "source": "vu",
                    "target": "marijtje a j duijn"
                }, {
                    "source": "vu",
                    "target": "ad w smitsman"
                }, {
                    "source": "vu",
                    "target": "r g carson"
                }, {
                    "source": "vu",
                    "target": "mark willems"
                }, {
                    "source": "vu",
                    "target": "m f bobbert"
                }, {
                    "source": "vu",
                    "target": "f m brazier"
                }, {
                    "source": "vu",
                    "target": "tom a b snijders"
                }, {
                    "source": "vu",
                    "target": "j g snijders"
                }, {
                    "source": "vu",
                    "target": "claire f michaels"
                }, {
                    "source": "vu",
                    "target": "j treur"
                }, {
                    "source": "vu",
                    "target": "h a van den berg"
                }, {
                    "source": "vu",
                    "target": "j van der kamp"
                }, {
                    "source": "vu",
                    "target": "p h g van langen"
                }, {
                    "source": "vu",
                    "target": "jaap harlaar"
                }, {
                    "source": "vu",
                    "target": "c g baan"
                }, {
                    "source": "vu",
                    "target": "a l hof"
                }, {
                    "source": "vu",
                    "target": "richard s j tol"
                }, {
                    "source": "vu",
                    "target": "p j beek"
                }, {
                    "source": "vu",
                    "target": "c e peper"
                }, {
                    "source": "vu",
                    "target": "a a post"
                }, {
                    "source": "vu",
                    "target": "joost c dessing"
                }, {
                    "source": "m p boer",
                    "target": "faculteit der aard en levenswetenschappen"
                }, {
                    "source": "p a j b m huijing",
                    "target": "m f bobbert"
                }, {
                    "source": "p a j b m huijing",
                    "target": "c g baan"
                }, {
                    "source": "m a g van offenbeek",
                    "target": "paul l koopman"
                }, {
                    "source": "s j a van gisbergen",
                    "target": "e j baerends"
                }, {
                    "source": "s j a van gisbergen",
                    "target": "j g snijders"
                }, {
                    "source": "j f stins",
                    "target": "claire f michaels"
                }, {
                    "source": "j f stins",
                    "target": "p j beek"
                }, {
                    "source": "g g van de bunt",
                    "target": "marijtje a j duijn"
                }, {
                    "source": "g g van de bunt",
                    "target": "tom a b snijders"
                }, {
                    "source": "e j baerends",
                    "target": "j g snijders"
                }, {
                    "source": "bert steenbergen",
                    "target": "ad w smitsman"
                }, {
                    "source": "bert steenbergen",
                    "target": "r g carson"
                }, {
                    "source": "bert steenbergen",
                    "target": "j van der kamp"
                }, {
                    "source": "faculteit der aard en levenswetenschappen",
                    "target": "h a van den berg"
                }, {
                    "source": "faculteit der aard en levenswetenschappen",
                    "target": "richard s j tol"
                }, {
                    "source": "faculteit der aard en levenswetenschappen",
                    "target": "vu"
                }, {
                    "source": "marijtje a j duijn",
                    "target": "tom a b snijders"
                }, {
                    "source": "ad w smitsman",
                    "target": "r g carson"
                }, {
                    "source": "ad w smitsman",
                    "target": "claire f michaels"
                }, {
                    "source": "ad w smitsman",
                    "target": "j van der kamp"
                }, {
                    "source": "r g carson",
                    "target": "j van der kamp"
                }, {
                    "source": "mark willems",
                    "target": "f m brazier"
                }, {
                    "source": "mark willems",
                    "target": "j treur"
                }, {
                    "source": "mark willems",
                    "target": "p h g van langen"
                }, {
                    "source": "m f bobbert",
                    "target": "jaap harlaar"
                }, {
                    "source": "m f bobbert",
                    "target": "c g baan"
                }, {
                    "source": "m f bobbert",
                    "target": "a l hof"
                }, {
                    "source": "f m brazier",
                    "target": "j treur"
                }, {
                    "source": "f m brazier",
                    "target": "p h g van langen"
                }, {
                    "source": "j treur",
                    "target": "p h g van langen"
                }, {
                    "source": "j treur",
                    "target": "vu"
                }, {
                    "source": "jaap harlaar",
                    "target": "a l hof"
                }, {
                    "source": "p j beek",
                    "target": "jaap h van dieen"
                }, {
                    "source": "p j beek",
                    "target": "luc p j selen"
                }, {
                    "source": "p j beek",
                    "target": "c e peper"
                }, {
                    "source": "p j beek",
                    "target": "a a post"
                }, {
                    "source": "jaap h van dieen",
                    "target": "luc p j selen"
                }, {
                    "source": "c e peper",
                    "target": "a a post"
                }, {
                    "source": "c e peper",
                    "target": "vu"
                }, {
                    "source": "c e peper",
                    "target": "joost c dessing"
                }, {
                    "source": "vu",
                    "target": "joost c dessing"
                }],
                categories: [{
                    'name': 'a daffertshofer'
                }, {
                    'name': 'vu'
                }, {
                    'name': 'p j beek'
                }, {
                    'name': 'c e peper'
                }],
                focusNodeAdjacency: true,
                roam: true,
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
</body>
</html>
