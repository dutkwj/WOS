<html>
<head>
    <meta charset="utf-8">
    <title>worldMap</title>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/d3.v3.min.js"></script>
    <script src="/js/d3.geo.projection.v0.min.js"></script>
    <script src="/js/topojson.v1.min.js"></script>
    <style>
        .stroke {
            fill: none;
            stroke: none;
            stroke-width: 3px;
        }
        .fill {
            fill: #66cccc;
        }
        .graticule {
            fill: none;
            stroke: #777;
            stroke-width: .5px;
            stroke-opacity: .5;
        }
        .land {
            fill: #ccff66;
        }
        .boundary {
            fill: none;
            stroke: #fff;
            stroke-width: .5px;
        }
        .points circle {
            fill: #fff;
            stroke: #ff99cc;
            stroke-width: 2px;
        }
        .points text {
            font: 11px sans-serif;
            text-anchor: middle;
            text-shadow: 0 1px 0 #fff, 0 -1px 0 #fff, 1px 0 0 #fff, -1px 0 0 #fff;
        }
        .route {
            fill: none;
            stroke: #ff99cc;
            stroke-width: 3px;
        }
    </style>
</head>

<body>
<div id="container" style="height: 100%">
</div>
    <script>
        var oParentWin= (window.parent)?(window.parent):(window.__parent__);
        var oParentBody= oParentWin.document.body;
        var width = oParentBody.clientWidth;
//        var width = 1000;
        var height = oParentBody.clientHeight + 300;
        var places = {};
        <#if middleScholar.latlng??>
        places["${middleScholar.name!""}"] = [${middleScholar.longitude!""}, ${middleScholar.latitude!""}];
        <#else>
        places["${middleScholar.name!""}"] = [77.02, 38.54];
        </#if>
        <#if cooperaters?? && (cooperaters?size>0)>
            <#list cooperaters as cooperater>
                <#if cooperater.latlng??>
                places["${cooperater.name!""}"] = [${cooperater.longitude!""}, ${cooperater.latitude!""}];
                </#if>
            </#list>
        </#if>
        var projection = d3.geo.kavrayskiy7()
                .scale(170)
                .rotate([-40, 0])
                .translate([width / 2 + 20, 350])
                .precision(.1);

        var path = d3.geo.path()
                .projection(projection);
        var graticule = d3.geo.graticule();
        var svg = d3.select("#container").append("svg")
                .attr("style", "position:absolute;margin-left:-200px;margin-top:5%;z-index:-2")
                .attr("width", width - 300)
                .attr("height", height / 2 + 100);
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

        var route = {type:"LineString"};
        <#if cooperaters?? && (cooperaters?size>0)>
            <#list cooperaters as cooperater>
                <#if cooperater.latlng??>
                route["coordinates"] = [places["${middleScholar.name!""}"], places["${cooperater.name!""}"]];
                svg.append("path")
                        .datum(route)
                        .attr("class", "route")
                        .attr("d", path);
                </#if>
            </#list>
        </#if>

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

        d3.json("/file/world-50m.json", function(error, world) {
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
                .attr("transform","translate("+(width/2 - 125)+","+(660)+")")
                .append("text")
                .text("cooperators' location on the world map")
                .attr("font-size", "17px")
                .style("fill", function (d, i) {
                    return "#666699";
                });

    </script>
</body>

</html>
