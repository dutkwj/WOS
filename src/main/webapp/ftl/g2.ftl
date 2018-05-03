<html>
<head>
    <meta charset="utf-8">
    <title>cooperate</title>

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
                        .attr("height", _height+100)
                        .attr("width", width);

                renderAxes(_svg);

                defineBodyClip(_svg);
            }

            renderBody(_svg);
            _svg.append("g")
                    .attr("transform","translate("+((width/2)-170)+","+(_height+28)+")")
                    .append("text")
                    .text("cooperators' count every year between 1980 and 2017");
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
                        return "translate(" + ((width-_width)/2 + 50) + "," + yStart() + ")";
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
                        return "translate(" + ((width-_width)/2+50) + "," + yEnd() + ")";
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
                                + ((width-_width)/2+50)   + ","
//                                + xStart() + ","
                                + yEnd() + ")") // <-2E
                        .attr("clip-path", "url(#body-clip)");

            renderLines();

            renderDots();
        }

        function renderLines() {
            _line = d3.svg.line() //<-4A
                    .x(function (d) { return _x(d.x + 1980); })
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

//        function xStart() {
//            return _margins.left;
//        }

        function yStart() {
            return _height - _margins.bottom;
        }
//
//        function xEnd() {
//            return _width - _margins.right;
//        }

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
    d = [];
    <#if cooperate?? && (cooperate?size>0)>
        <#list cooperate as cooperaters>
        d.push("name":"${cooperaters.name!""}"});
        </#list>
    </#if>
    var numberOfSeries = 1,

            data = [];
    <#if cooperate?? && (cooperate?size>0)>
        <#list cooperate as cooperaters>
        data.push({"value":${cooperaters.count!}});
        </#list>
    </#if>
    var j = 0;
    numberOfDataPoint = data.size(),
    for (var i = 0; i < d.size(); ++i)
        data.push(d3.range(j, numberOfDataPoint).map(function (i, j) {
            return {x: d[i], y: data[j]};
        }));

    var chart = lineChart()

    data.forEach(function (series) {
        chart.addSeries(series);
    });
    chart.render();
</script>
</body>
</html>