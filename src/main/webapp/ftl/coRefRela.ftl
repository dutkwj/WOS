<html>
<head>
    <meta charset="utf-8">
    <title>Force</title>

    <link rel="stylesheet" type="text/css" href="../css/styles.css"/>
    <script type="text/javascript" src="../js/d3.js"></script>

    <style>

        .nodetext {
            font-size: 12px ;
            font-family: SimSun;
            fill:#000000;
        }

        .linetext {
            font-size: 12px ;
            font-family: SimSun;
            fill:#1f77b4;
            fill-opacity:0.0;
        }

        .circleImg {
            stroke: #fff;
            stroke-width: 1.5px;
        }


        body {
            background: #fcfcfa;
        }

        .stroke {
            fill: none;
            stroke: #000;
            stroke-width: 3px;
        }

        .fill {
            fill: #fff;
        }

        .graticule {
            fill: none;
            stroke: #777;
            stroke-width: .5px;
            stroke-opacity: .5;
        }

        .land {
            fill: #bbb;
        }

        .boundary {
            fill: none;
            stroke: #fff;
            stroke-width: .5px;
        }

        .points circle {
            fill: #fff;
            stroke: red;
            stroke-width: 2px;
        }

        .points text {
            font: 11px sans-serif;
            text-anchor: middle;
            text-shadow: 0 1px 0 #fff, 0 -1px 0 #fff, 1px 0 0 #fff, -1px 0 0 #fff;
        }

        .route {
            fill: none;
            stroke: red;
            stroke-width: 3px;
        }
    </style>
</head>

<body>
<script src="../js/d3.v3.min.js" charset="utf-8"></script>
<script>
    var oParentWin= (window.parent)?(window.parent):(window.__parent__);
    var oParentBody= oParentWin.document.body;

    var width = oParentBody.clientWidth;
    var height = oParentBody.clientHeight;
    var img_w = 77;
    var img_h = 80;
    var radius = 30;    //圆形半径

    var svg = d3.select("body").append("svg")
            .attr("width",width)
            .attr("height",height);
    var g1 = svg.append("g");

    nodes = [
        { "name": "${middleScholar.name!""}"   , "image" : "../img/b.jpg" }];
    edges = [];
    var cooperaterIndex = 1;
    <#list coRefScholars as coRefScholar>
        nodes.push({"name": "${coRefScholar.name!""}"   , "image" : "../img/b.jpg"});
        edges.push({ "source": 0 , "target": cooperaterIndex , "relation":"共同引用关系" , "count":${coRefScholar.count!1}});
        cooperaterIndex = cooperaterIndex + 1;

    </#list>

    //D3力导向布局
    var force = d3.layout.force()
            .nodes(nodes)
            .links(edges)
            .size([width,height])
            .linkDistance(200)
            .charge(-1500)
            .start();

    //边
    var edges_line = g1.selectAll("line")
            .data(edges)
            .enter()
            .append("line")
            .style("stroke","#ccc")
            .style("stroke-width",function (d) {
                return d.count;
            });

    //边上的文字（人物之间的关系）
    var edges_text = g1.selectAll(".linetext")
            .data(edges)
            .enter()
            .append("text")
            .attr("class","linetext")
            .text(function(d){
                return d.count;
            });


    // 圆形图片节点（人物头像）
    var nodes_img = g1.selectAll("image")
            .data(nodes)
            .enter()
            .append("circle")
            .attr("class", "circleImg")
            .attr("r", radius)
            .attr("fill", function(d, i){

                //创建圆形图片
                var defs = g1.append("defs").attr("id", "imgdefs")

                var catpattern = defs.append("pattern")
                        .attr("id", "catpattern" + i)
                        .attr("height", 1)
                        .attr("width", 1)

                catpattern.append("image")
                        .attr("x", - (img_w / 2 - radius))
                        .attr("y", - (img_h / 2 - radius))
                        .attr("width", img_w)
                        .attr("height", img_h)
                        .attr("xlink:href", d.image)

                return "url(#catpattern" + i + ")";

            })
            .on("mouseover",function(d,i){
                //显示连接线上的文字
                edges_text.style("fill-opacity",function(edge){
                    if( edge.source === d || edge.target === d ){
                        return 1.0;
                    }
                });
            })
            .on("mouseout",function(d,i){
                //隐去连接线上的文字
                edges_text.style("fill-opacity",function(edge){
                    if( edge.source === d || edge.target === d ){
                        return 0.0;
                    }
                });
            })
            .call(force.drag);

    var text_dx = -20;
    var text_dy = 20;

    var nodes_text = g1.selectAll(".nodetext")
            .data(nodes)
            .enter()
            .append("text")
            .attr("class","nodetext")
            .attr("dx",text_dx)
            .attr("dy",text_dy)
            .text(function(d){
                return d.name;
            });


    force.on("tick", function(){

        //限制结点的边界
//        nodes.forEach(function(d,i){
//            d.x = d.x - img_w/2 < 0     ? img_w/2 : d.x ;
//            d.x = d.x + img_w/2 > width ? width - img_w/2 : d.x ;
//            d.y = d.y - img_h/2 < 0      ? img_h/2 : d.y ;
//            d.y = d.y + img_h/2 + text_dy > height ? height - img_h/2 - text_dy : d.y ;
//        });

        //更新连接线的位置
        edges_line.attr("x1",function(d){ return d.source.x; });
        edges_line.attr("y1",function(d){ return d.source.y; });
        edges_line.attr("x2",function(d){ return d.target.x; });
        edges_line.attr("y2",function(d){ return d.target.y; });

        //更新连接线上文字的位置
        edges_text.attr("x",function(d){ return (d.source.x + d.target.x) / 2 ; });
        edges_text.attr("y",function(d){ return (d.source.y + d.target.y) / 2 ; });


        //更新结点图片和文字
        nodes_img.attr("cx",function(d){ return d.x });
        nodes_img.attr("cy",function(d){ return d.y });

        nodes_text.attr("x",function(d){ return d.x });
        nodes_text.attr("y",function(d){ return d.y + img_w/2; });
    });


    svg.append("g")
            .attr("transform","translate("+(width/2)+","+(height-50)+")")
            .append("text")
            .text("图1");

</script>

<script src="../js/d3.v3.min.js"></script>
<script src="../js/d3.geo.projection.v0.min.js"></script>
<script src="../js/topojson.v1.min.js"></script>
<script>
    var width = oParentBody.clientWidth;
    var height = oParentBody.clientHeight;
//    var width = 960,
//            height = 570;

    var places = {
        HNL: [-157 - 55 / 60 - 21 / 3600, 21 + 19 / 60 + 07 / 3600],
        HKG: [113 + 54 / 60 + 53 / 3600, 25.30888888888889],
        SVO: [37 + 24 / 60 + 53 / 3600, 55 + 58 / 60 + 22 / 3600],
        HAV: [-82 - 24 / 60 - 33 / 3600, 22 + 59 / 60 + 21 / 3600],
        CCS: [-66 - 59 / 60 - 26 / 3600, 10 + 36 / 60 + 11 / 3600],
        UIO: [-78 - 21 / 60 - 31 / 3600, 0 + 06 / 60 + 48 / 3600],
        BJ:[116,39]
    };

    /*var route = {
      type: "LineString",
      coordinates: [
        places.HNL,
        places.HKG,
        places.SVO,
        places.HAV,
        places.CCS,
        places.UIO,
        places.BJ
      ]
    };
    */
    var route = {
        type: "LineString",
        coordinates: [
            places.HNL,
            places.HKG
        ]
    };
    var route1 = {
        type: "LineString",
        coordinates: [
            places.HNL,
            places.SVO
        ]
    };

    var projection = d3.geo.kavrayskiy7()
            .scale(170)
            .rotate([-40, 0])
            .translate([width / 2, height / 2])
            .precision(.1);

    var path = d3.geo.path()
            .projection(projection);

    var graticule = d3.geo.graticule();

    var svg = d3.select("body").append("svg")
            .attr("width", width)
            .attr("height", height);

    svg.append("defs").append("path")
            .datum({type: "Sphere"})
            .attr("id", "sphere")
            .attr("d", path);

    svg.append("use")
            .attr("class", "stroke")
            .attr("xlink:href", "#sphere");

    svg.append("use")
            .attr("class", "fill")
            .attr("xlink:href", "#sphere");

    svg.append("path")
            .datum(graticule)
            .attr("class", "graticule")
            .attr("d", path);

    svg.append("path")
            .datum(route)
            .attr("class", "route")
            .attr("d", path);

    svg.append("path")
            .datum(route1)
            .attr("class", "route")
            .attr("d", path);

    var point = svg.append("g")
            .attr("class", "points")
            .selectAll("g")
            .data(d3.entries(places))
            .enter().append("g")
            .attr("transform", function(d) { return "translate(" + projection(d.value) + ")"; });

    point.append("circle")
            .attr("r", 4.5);

    point.append("text")
            .attr("y", 10)
            .attr("dy", ".71em")
            .text(function(d) { return d.key; });

    d3.json("../file/world-50m.json", function(error, world) {
        if (error) throw error;

        svg.insert("path", ".graticule")
                .datum(topojson.feature(world, world.objects.land))
                .attr("class", "land")
                .attr("d", path);

        svg.insert("path", ".graticule")
                .datum(topojson.mesh(world, world.objects.countries, function(a, b) { return a !== b; }))
                .attr("class", "boundary")
                .attr("d", path);
    });

    d3.select(self.frameElement).style("height", height + "px");

    svg.append("g")
            .attr("transform","translate("+(width/2)+","+(height-250)+")")
            .append("text")
            .text("图2");

</script>



<script type="text/javascript">
    var width = oParentBody.clientWidth;
//    var height = oParentBody.clientHeight;
    function lineChart() { // <-1A
        var _chart = {};

        var _width = 600, _height = 300, // <-1B
                _margins = {top: 30, left: 30, right: 30, bottom: 30},
                _x, _y,
                _data = [],
                _colors = d3.scale.category10(),
                _svg,
                _bodyG,
                _line;

        _chart.render = function () { // <-2A
            if (!_svg) {
                _svg = d3.select("body").append("svg") // <-2B
                        .attr("height", _height+30)
                        .attr("width", width);

                renderAxes(_svg);

                defineBodyClip(_svg);
            }

            renderBody(_svg);
            _svg.append("g")
                    .attr("transform","translate("+(width/2)+","+(_height+28)+")")
                    .append("text")
                    .text("图3");
        };

        function renderAxes(svg) {
            var axesG = svg.append("g")
                    .attr("class", "axes");

            renderXAxis(axesG);

            renderYAxis(axesG);
        }

        function renderXAxis(axesG){
            var xAxis = d3.svg.axis()
                    .scale(_x.range([0, quadrantWidth()]))
//                    .scale(_x.range([0, width-40]))
                    .orient("bottom");

            axesG.append("g")
                    .attr("class", "x axis")
                    .attr("transform", function () {
                        return "translate(" + (width-_width)/2 + "," + yStart() + ")";
//                        return "translate(" + xStart() + "," + yStart() + ")";
                    })
                    .call(xAxis);

            /*      d3.selectAll("g.x g.tick")
                      .append("line")
                          .classed("grid-line", true)
                          .attr("x1", 0)
                          .attr("y1", 0)
                          .attr("x2", 0)
                          .attr("y2", - quadrantHeight());*/
        }

        function renderYAxis(axesG){
            var yAxis = d3.svg.axis()
                    .scale(_y.range([quadrantHeight(), 0]))
                    .orient("left");

            axesG.append("g")
                    .attr("class", "y axis")
                    .attr("transform", function () {
                        return "translate(" + (width-_width)/2 + "," + yEnd() + ")";
//                        return "translate(" + xStart() + "," + yEnd() + ")";
                    })
                    .call(yAxis);

            /*         d3.selectAll("g.y g.tick")
                        .append("line")
                            .classed("grid-line", true)
                            .attr("x1", 0)
                            .attr("y1", 0)
                            .attr("x2", quadrantWidth())
                            .attr("y2", 0); */
        }

        function defineBodyClip(svg) { // <-2C
            var padding = 5;

            svg.append("defs")
                    .append("clipPath")
                    .attr("id", "body-clip")
                    .append("rect")
                    .attr("x", 0 - padding)
                    .attr("y", 0)
                    .attr("width", quadrantWidth() + 2 * padding)
                    .attr("height", quadrantHeight());
        }

        function renderBody(svg) { // <-2D
            if (!_bodyG)
                _bodyG = svg.append("g")
                        .attr("class", "body")
                        .attr("transform", "translate("
                                + (width-_width)/2   + ","
//                                + xStart() + ","
                                + yEnd() + ")") // <-2E
                        .attr("clip-path", "url(#body-clip)");

            renderLines();

            renderDots();
        }

        function renderLines() {
            _line = d3.svg.line() //<-4A
                    .x(function (d) { return _x(d.x); })
                    .y(function (d) { return _y(d.y); });

            _bodyG.selectAll("path.line")
                    .data(_data)
                    .enter() //<-4B
                    .append("path")
                    .style("stroke", function (d, i) {
                        return _colors(i); //<-4C
                    })
                    .attr("class", "line");

            _bodyG.selectAll("path.line")
                    .data(_data)
                    .transition() //<-4D
                    .attr("d", function (d) { return _line(d); });
        }

        function renderDots() {
            _data.forEach(function (list, i) {
                _bodyG.selectAll("circle._" + i) //<-4E
                        .data(list)
                        .enter()
                        .append("circle")
                        .attr("class", "dot _" + i);

                _bodyG.selectAll("circle._" + i)
                        .data(list)
                        .style("stroke", function (d) {
                            return _colors(i); //<-4F
                        })
                        .transition() //<-4G
                        .attr("cx", function (d) { return _x(d.x); })
                        .attr("cy", function (d) { return _y(d.y); })
                        .attr("r", 4.5);
            });
        }

        function xStart() {
            return _margins.left;
        }

        function yStart() {
            return _height - _margins.bottom;
        }

        function xEnd() {
            return _width - _margins.right;
        }

        function yEnd() {
            return _margins.top;
        }

        function quadrantWidth() {
            return _width - _margins.left - _margins.right;
        }

        function quadrantHeight() {
            return _height - _margins.top - _margins.bottom;
        }

        _chart.width = function (w) {
            if (!arguments.length) return _width;
            _width = w;
            return _chart;
        };

        _chart.height = function (h) { // <-1C
            if (!arguments.length) return _height;
            _height = h;
            return _chart;
        };

        _chart.margins = function (m) {
            if (!arguments.length) return _margins;
            _margins = m;
            return _chart;
        };

        _chart.colors = function (c) {
            if (!arguments.length) return _colors;
            _colors = c;
            return _chart;
        };

        _chart.x = function (x) {
            if (!arguments.length) return _x;
            _x = x;
            return _chart;
        };

        _chart.y = function (y) {
            if (!arguments.length) return _y;
            _y = y;
            return _chart;
        };

        _chart.addSeries = function (series) { // <-1D
            _data.push(series);
            return _chart;
        };

        return _chart; // <-1E
    }

    function randomData() {
        return Math.random() * 9;
    }



    var numberOfSeries = 1,
            numberOfDataPoint = 11,
            data = [];

    for (var i = 0; i < numberOfSeries; ++i)
        data.push(d3.range(numberOfDataPoint).map(function (i) {
            return {x: i, y: randomData()};
        }));

    var chart = lineChart()
            .x(d3.scale.linear().domain([0, 10]))
            .y(d3.scale.linear().domain([0, 10]));

    data.forEach(function (series) {
        chart.addSeries(series);
    });

    chart.render();


</script>

</body>
</html>