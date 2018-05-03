<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 600%"></div>
<script src="../js/echarts.min.js" charset="utf-8"></script>
<script src="../js/echarts-gl.min.js" charset="utf-8"></script>
<script src="../js/ecStat.min.js" charset="utf-8"></script>
<script src="../js/dataTool.min.js" charset="utf-8"></script>
<script src="../js/china.js" charset="utf-8"></script>
<script src="../js/world.js" charset="utf-8"></script>
<script src="../js/bmap.min.js" charset="utf-8"></script>
<script src="../js/simplex.js" charset="utf-8"></script>
<script src="../js/d3.v4.min.js" charset="utf-8"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
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
            title:{
                text: "合作网络",
                top: "top",
                left: "center"
            },
            tooltip: {},
            animationDuration: 3000,
            animationEasingUpdate: 'quinticInOut',
            series: [{
                name: '节点',
                type: 'graph',
                layout: 'force',

                force: {
                    repulsion: 500
                },
                data: [{
                    "name": "a daffertshofer",
                    // "x": 0,
                    // y: 0,
                    "symbolSize": 20,
                    "category": "a daffertshofer",
                    "draggable": "true",
                    "value": 27

                }, {
                    "name": "vu",
                    "value": 3,
                    "symbolSize": 15,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "m p boer",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "p a j b m huijing",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "m a g van offenbeek",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "s j a van gisbergen",
                    "value": 6,
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "j f stins",
                    "symbolSize":10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "paul l koopman",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "g g van de bunt",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "e j baerends",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "bert steenbergen",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "faculteit der aard en levenswetenschappen",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "marijtje a j duijn",
                    "value": 5,
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "ad w smitsman",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "r g carson",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "mark willems",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "m f bobbert",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "f m brazier",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "tom a b snijders",
                    "value": 6,
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true"
                }, {
                    "name": "j g snijders",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "claire f michaels",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "j treur",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "h a van den berg",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "j van der kamp",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "p h g van langen",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "jaap harlaar",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "c g baan",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "a l hof",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "richard s j tol",
                    "symbolSize": 10,
                    "category": "vu",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "p j beek",
                    "symbolSize": 15,
                    "category": "p j beek",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "jaap h van dieen",
                    "symbolSize": 10,
                    "category": "p j beek",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "luc p j selen",
                    "symbolSize": 10,
                    "category": "p j beek",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "c e peper",
                    "symbolSize": 15,
                    "category": "c e peper",
                    "draggable": "true",
                    "value": 1
                }, {
                    "name": "a a post",
                    "value": 5,
                    "symbolSize": 10,
                    "category": "c e peper",
                    "draggable": "true"
                }, {
                    "name": "joost c dessing",
                    "symbolSize": 10,
                    "category": "c e peper",
                    "draggable": "true",
                    "value": 1
                }],
                links: [{
                    "source": "vu",
                    "target": "m p boer"
                }, {
                    "source": "m p boer",
                    "target": "faculteit der aard en levenswetenschappen"
                }, {
                    "source": "vu",
                    "target": "p a j b m huijing"
                }, {
                    "source": "p a j b m huijing",
                    "target": "m f bobbert"
                }, {
                    "source": "p a j b m huijing",
                    "target": "c g baan"
                }, {
                    "source": "vu",
                    "target": "m a g van offenbeek"
                }, {
                    "source": "m a g van offenbeek",
                    "target": "paul l koopman"
                }, {
                    "source": "vu",
                    "target": "s j a van gisbergen"
                }, {
                    "source": "s j a van gisbergen",
                    "target": "e j baerends"
                }, {
                    "source": "s j a van gisbergen",
                    "target": "j g snijders"
                }, {
                    "source": "vu",
                    "target": "j f stins"
                }, {
                    "source": "j f stins",
                    "target": "claire f michaels"
                }, {
                    "source": "vu",
                    "target": "paul l koopman"
                }, {
                    "source": "vu",
                    "target": "g g van de bunt"
                }, {
                    "source": "g g van de bunt",
                    "target": "marijtje a j duijn"
                }, {
                    "source": "g g van de bunt",
                    "target": "tom a b snijders"
                }, {
                    "source": "vu",
                    "target": "e j baerends"
                }, {
                    "source": "e j baerends",
                    "target": "j g snijders"
                }, {
                    "source": "vu",
                    "target": "bert steenbergen"
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
                    "source": "vu",
                    "target": "faculteit der aard en levenswetenschappen"
                }, {
                    "source": "faculteit der aard en levenswetenschappen",
                    "target": "h a van den berg"
                }, {
                    "source": "faculteit der aard en levenswetenschappen",
                    "target": "richard s j tol"
                }, {
                    "source": "vu",
                    "target": "marijtje a j duijn"
                }, {
                    "source": "marijtje a j duijn",
                    "target": "tom a b snijders"
                }, {
                    "source": "vu",
                    "target": "ad w smitsman"
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
                    "source": "vu",
                    "target": "r g carson"
                }, {
                    "source": "r g carson",
                    "target": "j van der kamp"
                }, {
                    "source": "vu",
                    "target": "mark willems"
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
                    "source": "vu",
                    "target": "m f bobbert"
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
                    "source": "vu",
                    "target": "f m brazier"
                }, {
                    "source": "f m brazier",
                    "target": "j treur"
                }, {
                    "source": "f m brazier",
                    "target": "p h g van langen"
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
                    "source": "j treur",
                    "target": "p h g van langen"
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
                    "source": "a daffertshofer",
                    "target": "c e peper"
                }, {
                    "source": "vu",
                    "target": "c e peper"
                }, {
                    "source": "vu",
                    "target": "jaap harlaar"
                }, {
                    "source": "jaap harlaar",
                    "target": "a l hof"
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
                    "source": "a daffertshofer",
                    "target": "vu"
                }, {
                    "source": "vu",
                    "target": "p j beek"
                }, {
                    "source": "vu",
                    "target": "c e peper"
                }, {
                    "source": "p j beek",
                    "target": "jaap h van dieen"
                }, {
                    "source": "jaap h van dieen",
                    "target": "luc p j selen"
                }, {
                    "source": "p j beek",
                    "target": "luc p j selen"
                }, {
                    "source": "a daffertshofer",
                    "target": "p j beek"
                }, {
                    "source": "p j beek",
                    "target": "c e peper"
                }, {
                    "source": "a daffertshofer",
                    "target": "a a post"
                }, {
                    "source": "c e peper",
                    "target": "a a post"
                }, {
                    "source": "c e peper",
                    "target": "vu"
                }, {
                    "source": "vu",
                    "target": "joost c dessing"
                }, {
                    "source": "c e peper",
                    "target": "joost c dessing"
                }, {
                    "source": "a daffertshofer",
                    "target": "c e peper"
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
</body>
</html>