<html>
<head>
    <meta charset="utf-8">
    <title>collaborator number</title>

    <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    <script src="/js/d3.v3.min.js" charset="utf-8"></script>

</head>

<body>
<div id="container">
</div>

<script type="text/javascript">
    var oParentWin= (window.parent)?(window.parent):(window.__parent__);
    var oParentBody= oParentWin.document.body;
    var width = oParentBody.clientWidth;
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
                _svg = d3.select("#container").append("svg") // <-2B
                        .attr("style", "position:absolute;margin-left:-200px;margin-top:10%;z-index:-2")
                        .attr("height", _height+100)
                        .attr("width", width);

                renderAxes(_svg);

                defineBodyClip(_svg);
            }

            renderBody(_svg);
            _svg.append("g")
                    .attr("transform","translate("+((width/2)-180)+","+(_height+28)+")")
                    .append("text")
                    .text("cooperators' count every year between 1980 and 2017")
                    .attr("font-size", "17px")
                    .style("fill", function (d, i) {
                        return "#666699";
                    });
        };

        function renderAxes(svg) {
            var axesG = svg.append("g")
                    .attr("class", "axes")
                    .style("fill", function (d, i) {
//                        return _colors(i); //<-4C
                        return "#66cccc";
                    });

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
                    })
                    .style("fill", function (d, i) {
                        return "#66cccc";
                    })
                    .call(xAxis);
        }

        function renderYAxis(axesG){
            var yAxis = d3.svg.axis()
                    .scale(_y.range([quadrantHeight(), 0]))
                    .orient("left");

            axesG.append("g")
                    .attr("class", "y axis")
                    .attr("transform", function () {
                        return "translate(" + ((width-_width)/2+50) + "," + yEnd() + ")";
                    })
                    .call(yAxis);
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
//                        return _colors(i); //<-4C
                        return "#66cccc";
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
                            return "#ff99cc";
                        })
                        .transition() //<-4G
                        .attr("cx", function (d) { return _x(d.x + 1980); })
                        .attr("cy", function (d) { return _y(d.y); })
                        .attr("r", 4.5);
            });
        }

        function yStart() {
            return _height - _margins.bottom;
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

    var numberOfSeries = 1,
            numberOfDataPoint = 37,
            data = [];
    <#if yearCounts?? && (yearCounts?size>0)>
        <#list yearCounts as yearCount>
            data.push(${yearCount.count!""});
        </#list>
    </#if>
    var j = 0;
    for (var i = 0; i < numberOfSeries; ++i)
        data.push(d3.range(j, numberOfDataPoint).map(function (i, j) {
            return {x: i, y: data[j]};
        }));

    var chart = lineChart()
            .x(d3.scale.linear().domain([1980, 2017]))
            .y(d3.scale.linear().domain([0, 21]));

    data.forEach(function (series) {
        chart.addSeries(series);
    });
    chart.render();
</script>
</body>

</html>
