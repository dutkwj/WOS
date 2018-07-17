
function createV4SelectableForceDirectedGraph(svg, graph,id_c) {
    if (typeof d3 == 'undefined')
        d3 = d3;
    var fisheye = d3.fisheye.circular()
        .radius(80)
        .distortion(5);
    var width = +svg.attr("width"),
        height = +svg.attr("height");


    var  color = d3.scaleOrdinal(d3.schemeCategory20),
        valueline = d3.line()
            .x(function(d) { return d[0]; })
            .y(function(d) { return d[1]; })
            .curve(d3.curveCatmullRomClosed),
        paths,
        groups,
        groupIds,
        scaleFactor = 1.56,
        polygon,
        centroid;
    // curveTypes = ['curveBasisClosed', 'curveCardinalClosed', 'curveCatmullRomClosed', 'curveLinearClosed'];

// //节点半径比例尺
    var max_r=graph.maxsize;
    var min_r=graph.minsize;
    var linear_r = d3.scaleLinear()
        .domain([min_r, max_r])
        .range([2, 10]);

// //边粗细的比例尺
    var max_link=graph.maxlink;
    var min_link=graph.minlink;
    var linear_link = d3.scaleLinear()
        .domain([min_link, max_link])
        .range([2, 6]);

    let parentWidth = d3.select('svg').node().parentNode.clientWidth;
    let parentHeight = d3.select('svg').node().parentNode.clientHeight;


    var svg = d3.select('svg')
        .attr('width', parentWidth)
        .attr('height', parentHeight)


    // remove any previous graphs
    svg.selectAll('.g-main').remove();



    var gMain = svg.append('g')
        .classed('g-main', true);
    var gDraw = gMain.append('g');
    // magnifier as path
    var mag = gDraw.append("path")
        .attr("class", "mag");

    // specify angle where magnifier handle should "attach" to body
    var omega = 0.78;

    // magnifier handle as path
    var mag2 = gDraw.append("path")
        .attr("class", "mag2");


    var zoom = d3.zoom()
        .on('zoom', zoomed)

    svg.call(zoom);

    function zoomed() {
        gMain.attr('transform', d3.event.transform);
    }

    // var color = d3.scaleOrdinal(d3.schemeCategory20);

    if (! ("links" in graph)) {
        console.log("Graph is missing links");
        return;
    }

    var nodes = {};
    // links between nodes
    var links = graph.links;
    var i;
    for (i = 0; i < graph.nodes.length; i++) {
        nodes[graph.nodes[i].id] = graph.nodes[i];
        graph.nodes[i].weight = 1.01;
    }

    // the brush needs to go before the nodes so that it doesn't
    // get called when the mouse is over a node
    var gBrushHolder = gDraw.append('g');
    var gBrush = null;
    groups = gDraw.append('g').attr('class', 'groups');

    var link = gDraw.append("g")
        .attr("class", "link")
        .selectAll("line")
        .data(graph.links)
        .enter()
        .append("line")
        .attr("stroke-width", function(d) {  return linear_link(d.intensity) });
    var node = gDraw.append("g")
        .attr("class", "node")
        .selectAll("circle")
        .data(graph.nodes)
        .enter().append("circle")
        .attr("r", function(d){
            return linear_r(d.size)
        })
        .attr("fill", function(d) {
            if(d.id==id_c){
                return "red"
            }else{
                return color(d.color);
                // return compute_color(linear_color(d.size_color));
            }

        })
        .on("mouseover", mouseOver(.1))
        .on("mouseout", mouseOut)
        .on("click", function(d){

            // console.log(d.id);
            // qindex = d.qindex;
            // hindex = d.hindex;
            // aff = d.hindex;
            // studyfield = d.studyField;
            // scholarname = d.name;
            $('#q_index').html(d.qindex);
            $('#h_index').html(d.hindex);
            $('#aff').html(d.aff);
            $('#studyField').html(d.studyField);
            $('#scholarName').html(d.name);
            index = d.id;


            var sc = {};
            sc.id = d.id;
            sc.name = d.name;

            addRecentVisit(sc);
            dispHtml();


            $('.cd-item').append('<img src="/img/images/users/scholarImg.png" >');
            var selectedImage = $('.cd-item').children('img'),
                slectedImageUrl = selectedImage.attr('src');

            $('body').addClass('overlay-layer');
            animateQuickView(selectedImage, sliderFinalWidth, maxQuickWidth, 'open');
            updateQuickView(slectedImageUrl);
        })
        .call(d3.drag()
            .on("start", dragstarted)
            .on("drag", dragged)
            .on("end", dragended));
    var text=gDraw.append("g")
        .attr("class", "text")
        .selectAll('text')
        .data(graph.nodes)
        .enter()
        .append('text')
        .text(function(d) {
            return d.name; })
        .attr('font-size',5);
    var zu=[];
    graph.nodes.map(function(n) {
        return zu.push(n.color); })
    groupIds = d3.set(zu)
        .values()
        .map( function(groupId) {
            return {
                groupId : groupId,
                count : graph.nodes.filter(function(n) {
                    if(n.color == groupId){
                        return +1;
                    }else{
                        return +0;
                    }

                }).length
            };
        })
        .filter( function(group) {
            return group.count > 2;})
        .map( function(group) { return group.groupId; });


    paths = groups.selectAll('.path_placeholder')
        .data(groupIds, function(d) { return +d; })
        .enter()
        .append('g')
        .attr('class', 'path_placeholder')
        .append('path')
        // .attr('stroke', function(d) {
        //   return color(d);
        // })
        .attr('fill', function(d) { return color(d); })
    // .attr('opacity', 0.3);

    paths
        .transition()
        .duration(500)
        .attr('opacity', 1);

    function fish() {
        svg.on("mousemove", function() {
            fisheye.focus(d3.mouse(this));
            var mouseX = d3.mouse(this)[0];
            var mouseY = d3.mouse(this)[1];
            var r = fisheye.radius();

            // path for magnifier
            var magPath = "M " + mouseX + "," + mouseY + " m -" + r + ", 0 a " + r + "," + r + " 0 1,0 " + (r * 2) + ",0 a " + r + "," + r + " 0 1,0 -" + (r * 2) + ",0";

            // point in circumference to attach magnifier handle
            var x1 = mouseX + r * Math.sin(omega);
            var y1 = mouseY + r * Math.cos(omega);

            // path for magnifier's handle
            var mag2Path = "M " + (x1 + 2) + "," + (y1 + 2) + " L" + (mouseX + r * 1.7) + "," + (mouseY + r * 1.7);

            // display magnifier as path
            mag.attr("d", magPath);

            // display magnifier handle as path
            mag2.attr("d", mag2Path);
            // };

            node.each(function(d) { d.fisheye = fisheye(d); })
                .attr("cx", function(d) {
                    // console.log(d);
                    return d.fisheye.x;
                })
                .attr("cy", function(d) {

                    return d.fisheye.y;
                });
            // .attr("r", function(d) { return d.fisheye.z * 4.5; });

            text.attr("x", function(d) { return d.fisheye.x; })
                .attr("y", function(d) { return d.fisheye.y; });

            link.attr("x1", function(d) { return d.source.fisheye.x; })
                .attr("y1", function(d) { return d.source.fisheye.y; })
                .attr("x2", function(d) { return d.target.fisheye.x; })
                .attr("y2", function(d) { return d.target.fisheye.y; });
            // updateGroups();
            // if (!d3.event.active) simulation.alphaTarget(0.3).restart();

        });
    }

    d3.select("#kaiguan").on("click", function () {
        if(this.checked){
            mag.style("stroke-opacity",1)
            mag2.style("stroke-opacity",1)
            paths.style("stroke-opacity",0)
            paths.style("fill-opacity",0)
            fish();
        }else{
            mag.style("stroke-opacity",0)
            mag2.style("stroke-opacity",0)
            paths.style("stroke-opacity",1)
            paths.style("fill-opacity",.3)
            svg.on("mousemove", null);

        }
    });
    // add titles for mouseover blurbs
    node.append("title")
        .text(function(d) {
            if ('name' in d)
                return d.name;
            else
                return d.id;
        });
    var simulation = d3.forceSimulation()
        .force("link", d3.forceLink()
            .id(function(d) { return d.id; })
            .distance(function(d) {
                // return 10;
                // console.log(d)
                var dist = 50 / d.intensity;
                //console.log('dist:', dist);
                return dist;
            })
        )
        .force("charge", d3.forceManyBody().strength(-100*77/graph.nodes.length))

        // .force("friction", 1)
        .force("center", d3.forceCenter(parentWidth / 2, parentHeight / 2))
        .force("x", d3.forceX(parentWidth/2))
        .force("y", d3.forceY(parentHeight/2));
    // .force("alphaTarget",0.3)



    // check the dictionary to see if nodes are linked
    function isConnected(a, b) {
        return linkedByIndex[a.index + "," + b.index] || linkedByIndex[b.index + "," + a.index] || a.index == b.index;
    }

    // fade nodes on hover
    function mouseOver(opacity) {
        return function(d) {
            // fade
            node.style("stroke-opacity", function(o) {
                thisOpacity = isConnected(d, o) ? 1 : opacity;
                return thisOpacity;
            });
            node.style("fill-opacity", function(o) {
                thisOpacity = isConnected(d, o) ? 1 : opacity;
                return thisOpacity;
            });
            // also style link accordingly
            link.style("stroke-opacity", function(o) {
                return o.source === d || o.target === d ? 1 : opacity;
            });
        };
    }

    function mouseOut() {
        node.style("stroke-opacity", 1);
        node.style("fill-opacity", 1);
        link.style("stroke-opacity", 1);
        // link.style("stroke", "#ddd");
    }

    simulation
        .nodes(graph.nodes)
        .on("tick", ticked);

    simulation.force("link")
        .links(links);


    // build a dictionary of nodes that are linked
    var linkedByIndex = {};
    links.forEach(function(d) {
        linkedByIndex[d.source.index + "," + d.target.index] = 1;
    });

    function ticked() {
        // update node and line positions at every step of 
        // the force simulation
        link.attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });

        node.attr("cx", function(d) { return d.x; })
            .attr("cy", function(d) { return d.y; });

        text.attr('x',  function(d) { return d.x; })
            .attr('y', function(d) { return d.y; });
        updateGroups();
    }

    var brushMode = false;
    var brushing = false;

    var brush = d3.brush()
        .on("start", brushstarted)
        .on("brush", brushed)
        .on("end", brushended);

    function brushstarted() {
        // keep track of whether we're actively brushing so that we
        // don't remove the brush on keyup in the middle of a selection
        brushing = true;

        node.each(function(d) {
            d.previouslySelected = shiftKey && d.selected;
        });
    }

    // rect.on('click', () => {
    //     node.each(function(d) {
    //         d.selected = false;
    //         d.previouslySelected = false;
    //     });
    //     node.classed("selected", false);
    // });

    function brushed() {
        if (!d3.event.sourceEvent) return;
        if (!d3.event.selection) return;

        var extent = d3.event.selection;

        node.classed("selected", function(d) {
            return d.selected = d.previouslySelected ^
                (extent[0][0] <= d.x && d.x < extent[1][0]
                    && extent[0][1] <= d.y && d.y < extent[1][1]);
        });
    }

    function brushended() {
        if (!d3.event.sourceEvent) return;
        if (!d3.event.selection) return;
        if (!gBrush) return;

        gBrush.call(brush.move, null);

        if (!brushMode) {
            // the shift key has been release before we ended our brushing
            gBrush.remove();
            gBrush = null;
        }

        brushing = false;
    }

    d3.select('body').on('keydown', keydown);
    d3.select('body').on('keyup', keyup);

    var shiftKey;

    function keydown() {
        shiftKey = d3.event.shiftKey;

        if (shiftKey) {
            // if we already have a brush, don't do anything
            if (gBrush)
                return;

            brushMode = true;

            if (!gBrush) {
                gBrush = gBrushHolder.append('g');
                gBrush.call(brush);
            }
        }
    }

    function keyup() {
        shiftKey = false;
        brushMode = false;

        if (!gBrush)
            return;

        if (!brushing) {
            // only remove the brush if we're not actively brushing
            // otherwise it'll be removed when the brushing ends
            gBrush.remove();
            gBrush = null;
        }
    }

    function dragstarted(d) {
        if (!d3.event.active) simulation.alphaTarget(0.3).restart();

        if (!d.selected && !shiftKey) {
            // if this node isn't selected, then we have to unselect every other node
            node.classed("selected", function(p) { return p.selected =  p.previouslySelected = false; });
        }

        d3.select(this).classed("selected", function(p) { d.previouslySelected = d.selected; return d.selected = true; });

        node.filter(function(d) { return d.selected; })
            .each(function(d) { //d.fixed |= 2;
                d.fx = d.x;
                d.fy = d.y;
            })

    }

    function dragged(d) {
        //d.fx = d3.event.x;
        //d.fy = d3.event.y;
        node.filter(function(d) { return d.selected; })
            .each(function(d) {
                d.fx += d3.event.dx;
                d.fy += d3.event.dy;
            })
    }

    function dragended(d) {
        if (!d3.event.active) simulation.alphaTarget(0);
        d.fx = null;
        d.fy = null;
        node.filter(function(d) { return d.selected; })
            .each(function(d) { //d.fixed &= ~6;
                d.fx = null;
                d.fy = null;
            })
    }
    var polygonGenerator = function(groupId) {
        var node_coords = node
            .filter(function(d) { return d.color == groupId; })
            .data()
            .map(function(d) { return [d.x, d.y]; });

        return d3.polygonHull(node_coords);
    };

    function updateGroups() {
        groupIds.forEach(function(groupId) {
            var path = paths.filter(function(d) { return d == groupId;})
                .attr('transform', 'scale(1) translate(0,0)')
                .attr('d', function(d) {
                    polygon = polygonGenerator(d);
                    centroid = d3.polygonCentroid(polygon);
                    // to scale the shape properly around its points:
                    // move the 'g' element to the centroid point, translate
                    // all the path around the center of the 'g' and then
                    // we can scale the 'g' element properly
                    return valueline(
                        polygon.map(function(point) {
                            return [  point[0] - centroid[0], point[1] - centroid[1] ];
                        })
                    );
                });

            d3.select(path.node().parentNode).attr('transform', 'translate('  + centroid[0] + ',' + (centroid[1]) + ') scale(' + scaleFactor + ')');
        });
    }

    // drag groups
    function group_dragstarted(groupId) {
        // if (!d3.event.active) simulation.alphaTarget(0.3).restart();
        d3.select(this).select('path').style('stroke-width', 3);
    }

    function group_dragged(groupId) {
        node
            .filter(function(d) { return d.color == groupId; })
            .each(function(d) {
                d.x += d3.event.dx;
                d.y += d3.event.dy;
            })
    }

    function group_dragended(groupId) {
        // if (!d3.event.active) simulation.alphaTarget(0.3).restart();
        d3.select(this).select('path').style('stroke-width', 1);
    }

    // var texts = ['Use the scroll wheel to zoom',
    //              'Hold the shift key to select nodes']

    // svg.selectAll('text')
    //     .data(texts)
    //     .enter()
    //     .append('text')
    //     .attr('x', 900)
    //     .attr('y', function(d,i) { return 470 + i * 18; })
    //     .text(function(d) { return d; });



    return graph;
};