<!DOCTYPE html>
<html lang="en" >

<head>

    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="https://production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
    <link rel="mask-icon" type="" href="https://production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
    <title>CodePen - Redesigned - Company Employees Hierarchy Chart </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css'>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto'>

    <style>
        .full-container {
            background-color: red;
            width: 100%;
            height: 100%;
            font-family: 'Roboto', sans-serif;
        }

        /*
              "name": "Davolio Nancy",
              "area": "Corporate",
              "isLoggedUser": false,
              "positionName": "CTO ",
         */

        /* ############################################## SVG ################################# */

        .nodeHasChildren {
            fill: white;
        }

        .nodeDoesNotHaveChildren {
            fill: white;
        }

        .nodeRepresentsCurrentUser {
            stroke: Chartreuse;
            stroke-width: 3;
        }

        text {
            fill: dimgray;
        }

        .link {
            fill: none;
            stroke: #ccc;
            stroke-width: 1.5px;
        }

        .node {
            cursor: pointer;
        }

        .node-collapse {
            stroke: grey;
        }

        .node-collapse-right-rect {
            fill: #70c645;
            stroke: #70c645;
        }

        .node text {
            fill: white;
            font-family: "Segoe UI", Arial, sans-serif;
            font-size: 10px;
        }

        .node circle {
            stroke-width: 1px;
            stroke: #70c645;
            fill: #70c645;
        }

        .node-group .emp-name {
            fill: #962828;
            font-size: 12px;
            font-weight: 600
        }

        .node-group .emp-position-name {
            fill: #59525b;
            font-size: 11px;
        }

        .node-group .emp-area {
            fill: #91a4a5;
            font-size: 10px;
        }

        .node-group .emp-count,
        .node-group .emp-count-icon {
            fill: #91a4a5;
            font-size: 12px;
        }
    </style>






</head>

<body translate="no" >

<div id="full-container">






    <div id="svgChart"></div>

</div>

<script src='/js/time_map/d3.min.js'></script>



<script >
    var params = {
        selector: "#svgChart",
        dataLoadUrl: "/file/12.json",
        chartWidth: window.innerWidth-40,
        chartHeight: window.innerHeight - 40,
        funcs: {

        },
        data: null
    }

    d3.json(params.dataLoadUrl, function(data) {
        params.data = data;
        console.log(params.data);
        params.pristinaData = JSON.parse(JSON.stringify(data));
        drawOrganizationChart(params);
    })

    function drawOrganizationChart(params) {

        var attrs = {
            EXPAND_SYMBOL: '\uf067',
            COLLAPSE_SYMBOL: '\uf068',
            selector: params.selector,
            root: params.data,
            width: params.chartWidth,
            height: params.chartHeight,
            index: 0,
            nodePadding: 9,
            collapseCircleRadius: 7,
            nodeHeight: 80,
            nodeWidth: 210,
            duration: 750,
            rootNodeTopMargin: 20,
            minMaxZoomProportions: [0.05, 3],
            linkLineSize: 180,
            collapsibleFontSize: '10px',
            userIcon: '\uf007',
            nodeStroke: "#ccc",
            nodeStrokeWidth: '1px'
        }

        var dynamic = {}
        dynamic.nodeImageWidth = attrs.nodeHeight * 100 / 140;
        dynamic.nodeImageHeight = attrs.nodeHeight - 2 * attrs.nodePadding;
        dynamic.nodeTextLeftMargin = attrs.nodePadding * 2 + dynamic.nodeImageWidth
        dynamic.rootNodeLeftMargin = attrs.width / 2;
        dynamic.nodePositionNameTopMargin = attrs.nodePadding + 8 + dynamic.nodeImageHeight / 4 * 1
        dynamic.nodeChildCountTopMargin = attrs.nodePadding + 14 + dynamic.nodeImageHeight / 4 * 3

        var tree = d3.layout.tree().nodeSize([attrs.nodeWidth + 40, attrs.nodeHeight]);
        var diagonal = d3.svg.diagonal()
                .projection(function(d) {
//                    debugger;
                    return [d.x + attrs.nodeWidth / 2, d.y + attrs.nodeHeight / 2];
                });

        var zoomBehaviours = d3.behavior
                .zoom()
                .scaleExtent(attrs.minMaxZoomProportions)
                .on("zoom", redraw);

        var svg = d3.select(attrs.selector)
                .append("svg")
                .attr("width", attrs.width)
                .attr("height", attrs.height)
                .call(zoomBehaviours)
                .append("g")
                .attr("transform", "translate(" + attrs.width / 2 + "," + 20 + ")");

        //necessary so that zoom knows where to zoom and unzoom from
        zoomBehaviours.translate([dynamic.rootNodeLeftMargin, attrs.rootNodeTopMargin]);

        attrs.root.x0 = 0;
        attrs.root.y0 = dynamic.rootNodeLeftMargin;

        if (params.mode != 'department') {
            // adding unique values to each node recursively
            var uniq = 1;


        }

        expand(attrs.root);
        if (attrs.root.children) {
            attrs.root.children.forEach(collapse);
        }

        update(attrs.root);

        d3.select(attrs.selector).style("height", attrs.height);



        function update(source, param) {

            // Compute the new tree layout.
            var nodes = tree.nodes(attrs.root)
                            .reverse(),
                    links = tree.links(nodes);

            // Normalize for fixed-depth.
            nodes.forEach(function(d) {
                d.y = d.depth * attrs.linkLineSize;
            });

            // Update the nodes…
            var node = svg.selectAll("g.node")
                    .data(nodes, function(d) {
                        return d.id || (d.id = ++attrs.index);
                    });

            // Enter any new nodes at the parent's previous position.
            var nodeEnter = node.enter()
                    .append("g")
                    .attr("class", "node")
                    .attr("transform", function(d) {
                        return "translate(" + source.x0 + "," + source.y0 + ")";
                    })

            var nodeGroup = nodeEnter.append("g")
                    .attr("class", "node-group")


            nodeGroup.append("rect")
                    .attr("width", attrs.nodeWidth)
                    .attr("height", attrs.nodeHeight)
                    .attr("data-node-group-id",function(d){
                        return d.uniqueIdentifier;
                    })
                    .attr("class", function(d) {
                        var res = "";
                        if (d.isLoggedUser) res += 'nodeRepresentsCurrentUser ';
                        res += d._children || d.children ? "nodeHasChildren" : "nodeDoesNotHaveChildren";
                        return res;
                    });

            var collapsiblesWrapper =
                    nodeEnter.append('g')
                            .attr('data-id', function(v) {
                                return v.uniqueIdentifier;
                            });

            var collapsibleRects = collapsiblesWrapper.append("rect")
                    .attr('class', 'node-collapse-right-rect')
                    .attr('height', attrs.collapseCircleRadius)
                    .attr('fill', 'black')
                    .attr('x', attrs.nodeWidth - attrs.collapseCircleRadius)
                    .attr('y', attrs.nodeHeight - 7)
                    .attr("width", function(d) {
                        if (d.children || d._children) return attrs.collapseCircleRadius;
                        return 0;
                    })

            var collapsibles =
                    collapsiblesWrapper.append("circle")
                            .attr('class', 'node-collapse')
                            .attr('cx', attrs.nodeWidth - attrs.collapseCircleRadius)
                            .attr('cy', attrs.nodeHeight - 7)


            //hide collapse rect when node does not have children
            collapsibles.attr("r", function(d) {
                if (d.children || d._children) return attrs.collapseCircleRadius;
                return 0;
            })
                    .attr("height", attrs.collapseCircleRadius)

            collapsiblesWrapper.append("text")
                    .attr('class', 'text-collapse')
                    .attr("x", attrs.nodeWidth - attrs.collapseCircleRadius)
                    .attr('y', attrs.nodeHeight - 3)
                    .attr('width', attrs.collapseCircleRadius)
                    .attr('height', attrs.collapseCircleRadius)
                    .style('font-size', attrs.collapsibleFontSize)
                    .attr("text-anchor", "middle")
                    .style('font-family', 'FontAwesome')
                    .text(function(d) {
                        return d.collapseText;
                    })

            collapsiblesWrapper.on("click", click);



//////////////////////////////////框内属性/////////////////////////////////////////////////////
            nodeGroup.append("text")
                    .attr("x", dynamic.nodeTextLeftMargin)
                    .attr("y", attrs.nodePadding + 10)
                    .attr('class', 'emp-name')
                    .attr("text-anchor", "left")
                    .text(function(d) {
                        return d.name;   //name
                    })
                    .call(wrap, attrs.nodeWidth);

            nodeGroup.append("text")
                    .attr("x", dynamic.nodeTextLeftMargin)
                    .attr("y", dynamic.nodePositionNameTopMargin)
                    .attr('class', 'emp-position-name')
                    .attr("dy", ".35em")
                    .attr("text-anchor", "left")
                    .text(function(d) {
                        return d.AuthorId;   //AuthorId
                    })

            nodeGroup.append("text")
                    .attr("x", dynamic.nodeTextLeftMargin)
                    .attr("y", attrs.nodePadding + 10 + dynamic.nodeImageHeight / 4 * 2)
                    .attr('class', 'emp-area')
                    .attr("dy", ".35em")
                    .attr("text-anchor", "left")
                    .text(function(d) {
                        return d.year;         //year
                    })

            nodeGroup.append("text")
                    .attr("x", dynamic.nodeTextLeftMargin)
                    .attr("y", dynamic.nodeChildCountTopMargin)
                    .attr('class', 'emp-count-icon')
                    .attr("text-anchor", "left")
                    .style('font-family', 'FontAwesome')
                    .text(function(d) {
                        if (d.children || d._children) return attrs.userIcon;   //student_number
                    });

            nodeGroup.append("text")
                    .attr("x", dynamic.nodeTextLeftMargin + 13)
                    .attr("y", dynamic.nodeChildCountTopMargin)
                    .attr('class', 'emp-count')
                    .attr("text-anchor", "left")

                    .text(function(d) {
                        if (d.children) return d.children.length;
                        if (d._children) return d._children.length;
                        return;
                    })

            nodeGroup.append("defs").append("svg:clipPath")
                    .attr("id", "clip")
                    .append("svg:rect")
                    .attr("id", "clip-rect")
                    .attr("rx", 3)
                    .attr('x', attrs.nodePadding)
                    .attr('y', 2 + attrs.nodePadding)
                    .attr('width', dynamic.nodeImageWidth)
                    .attr('fill', 'none')
                    .attr('height', dynamic.nodeImageHeight - 4);



//////////////////////////////////框内属性/////////////////////////////////////////////////////


            // Transition nodes to their new position.
            var nodeUpdate = node.transition()
                    .duration(attrs.duration)
                    .attr("transform", function(d) {
                        return "translate(" + d.x + "," + d.y + ")";
                    })

            //todo replace with attrs object
            nodeUpdate.select("rect")
                    .attr("width", attrs.nodeWidth)
                    .attr("height", attrs.nodeHeight)
                    .attr('rx', 3)
                    .attr("stroke", function(d){
                        if(param && d.uniqueIdentifier== param.locate){
                            return '#a1ceed'
                        }
                        return attrs.nodeStroke;
                    })
                    .attr('stroke-width', function(d){
                        if(param && d.uniqueIdentifier== param.locate){
                            return 6;
                        }
                        return attrs.nodeStrokeWidth})

            // Transition exiting nodes to the parent's new position.
            var nodeExit = node.exit().transition()
                    .duration(attrs.duration)
                    .attr("transform", function(d) {
                        return "translate(" + source.x + "," + source.y + ")";
                    })
                    .remove();

            nodeExit.select("rect")
                    .attr("width", attrs.nodeWidth)
                    .attr("height", attrs.nodeHeight)

            // Update the links…
            var link = svg.selectAll("path.link")
                    .data(links, function(d) {
                        return d.target.id;
                    });

            // Enter any new links at the parent's previous position.
            link.enter().insert("path", "g")
                    .attr("class", "link")
                    .attr("x", attrs.nodeWidth / 2)
                    .attr("y", attrs.nodeHeight / 2)
                    .attr("d", function(d) {
                        var o = {
                            x: source.x0,
                            y: source.y0
                        };
                        return diagonal({
                            source: o,
                            target: o
                        });
                    });

            // Transition links to their new position.
            link.transition()
                    .duration(attrs.duration)
                    .attr("d", diagonal)
            ;

            // Transition exiting nodes to the parent's new position.
            link.exit().transition()
                    .duration(attrs.duration)
                    .attr("d", function(d) {
                        var o = {
                            x: source.x,
                            y: source.y
                        };
                        return diagonal({
                            source: o,
                            target: o
                        });
                    })
                    .remove();

            // Stash the old positions for transition.
            nodes.forEach(function(d) {
                d.x0 = d.x;
                d.y0 = d.y;
            });

            if(param && param.locate){
                var x;
                var y;

                nodes.forEach(function(d) {
                    if (d.uniqueIdentifier == param.locate) {
                        x = d.x;
                        y = d.y;
                    }
                });







                // normalize for width/height
                var new_x = (-x + (window.innerWidth / 2));
                var new_y = (-y + (window.innerHeight / 2));

                // move the main container g
                svg.attr("transform", "translate(" + new_x + "," + new_y + ")")
                zoomBehaviours.translate([new_x, new_y]);
                zoomBehaviours.scale(1);
            }

            if (param && param.centerMySelf) {
                var x;
                var y;

                nodes.forEach(function(d) {
                    if (d.isLoggedUser) {
                        x = d.x;
                        y = d.y;
                    }

                });

                // normalize for width/height
                var new_x = (-x + (window.innerWidth / 2));
                var new_y = (-y + (window.innerHeight / 2));

                // move the main container g
                svg.attr("transform", "translate(" + new_x + "," + new_y + ")")
                zoomBehaviours.translate([new_x, new_y]);
                zoomBehaviours.scale(1);
            }

        }

        // Toggle children on click.
        function click(d) {

            d3.select(this).select("text").text(function(dv) {

                if (dv.collapseText == attrs.EXPAND_SYMBOL) {
                    dv.collapseText = attrs.COLLAPSE_SYMBOL
                } else {
                    if (dv.children) {
                        dv.collapseText = attrs.EXPAND_SYMBOL
                    }
                }
                return dv.collapseText;

            })

            if (d.children) {
                d._children = d.children;
                d.children = null;
            } else {
                d.children = d._children;
                d._children = null;
            }
            update(d);

        }

        //########################################################

        //Redraw for zoom
        function redraw() {
            //console.log("here", d3.event.translate, d3.event.scale);
            svg.attr("transform",
                    "translate(" + d3.event.translate + ")" +
                    " scale(" + d3.event.scale + ")");
        }

        // #############################   Function Area #######################
        function wrap(text, width) {

            text.each(function() {
                var text = d3.select(this),
                        words = text.text().split(/\s+/).reverse(),
                        word,
                        line = [],
                        lineNumber = 0,
                        lineHeight = 1.1, // ems
                        x = text.attr("x"),
                        y = text.attr("y"),
                        dy = 0, //parseFloat(text.attr("dy")),
                        tspan = text.text(null)
                                .append("tspan")
                                .attr("x", x)
                                .attr("y", y)
                                .attr("dy", dy + "em");
                while (word = words.pop()) {
                    line.push(word);
                    tspan.text(line.join(" "));
                    if (tspan.node().getComputedTextLength() > width) {
                        line.pop();
                        tspan.text(line.join(" "));
                        line = [word];
                        tspan = text.append("tspan")
                                .attr("x", x)
                                .attr("y", y)
                                .attr("dy", ++lineNumber * lineHeight + dy + "em")
                                .text(word);
                    }
                }
            });
        }





        function expand(d) {
            if (d.children) {
                d.children.forEach(expand);
            }

            if (d._children) {
                d.children = d._children;
                d.children.forEach(expand);
                d._children = null;
            }

            if (d.children) {
                // if node has children and it's expanded, then  display -
                setToggleSymbol(d, attrs.COLLAPSE_SYMBOL);
            }
        }

        function collapse(d) {
            if (d._children) {
                d._children.forEach(collapse);
            }
            if (d.children) {
                d._children = d.children;
                d._children.forEach(collapse);
                d.children = null;
            }

            if (d._children) {
                // if node has children and it's collapsed, then  display +
                setToggleSymbol(d, attrs.EXPAND_SYMBOL);
            }
        }



        function setToggleSymbol(d, symbol) {
            d.collapseText = symbol;
            d3.select("*[data-id='" + d.uniqueIdentifier + "']").select('text').text(symbol);
        }











    }
</script>






</body>

</html>