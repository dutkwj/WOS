<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
</head>
<!-- <form style="margin-left: 20px"> -->
<input type="checkbox"  id="kaiguan" />&nbsp;magnifying-glass<br/>
<!-- <input type="radio" name="wot" id="path" value="two" checked />&nbsp;as path -->
<!-- </form> -->
<div id="d3_selectable_force_directed_graph" style="width: 1200px; height: 800px;">

    <!-- <div id="d3_selectable_force_directed_graph1" style="width: 960px; height: 500px;"> -->
    <svg />
</div>
<link rel="stylesheet" type="text/css" href="/css/cooper_net/fisheye.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="/css/cooper_net/d3v4-selectable-zoomable-force-directed-graph.css" media="screen"/>

<script src="/js/time_map/d3.v4.min.js"></script>
<script src="/js/time_map/d3.v3.min.js"></script>
<script src="/js/time_map/d3v4-brush-lite.js"></script>
<script src="/js/time_map/force.js"></script>
<script src="/js/time_map/fisheye.js"></script>
<script type="text/javascript" src="/js/time_map/echarts.min.js"></script>

<script>
    var dom = document.getElementById("d3_selectable_force_directed_graph");
    var myChart = echarts.init(dom);
    option = null;
    myChart.showLoading();
    var svg = d3.select('#d3_selectable_force_directed_graph');
    // d3.json('data/miserables.with-ids.json', function(error, graph) {
    d3.json('/MVCJSON/${scholarId!""}', function(error, graph) {
        if (!error) {
           myChart.hideLoading();
            dom.innerHTML = "<svg />";
            createV4SelectableForceDirectedGraph(svg, graph,"${scholarId!""}");
        }else {
            console.error(error);
        }
    });
</script>