
//github

function yinyong(zhong){
    var optArray = []; //place holder for search names
    var w = document.getElementById("graph").scrollWidth,
        h = document.getElementById("graph").scrollHeight;
// console.log(w)
    var focus_node = null,
        highlight_node = null;

    var text_center = false;

    var highlight_color = "#759FB8";
    var highlight_trans = 0.1;

    var size = d3v3.scale.linear()
        .range([10,80]);

    var thickness = d3v3.scale.linear()
        .range([1, 20]);


    function judge_size(d,i){
        if(i!=0)return size(d);
        else return 120;
    }


    var default_comments_color = "#F6C8DA";
    var default_replies_color ="#93b7e3";
    var default_link_color = "#dddddd";
    var nominal_base_node_size = 8;
    var nominal_text_size = 10;
    var max_text_size = 24;
    var nominal_stroke = 4.86;
    var max_stroke = 5.5;
    var max_base_node_size = 41;
    var min_zoom = .2;
    var max_zoom = 7;
    var svg = d3v3.select("#graph").append("svg").attr("width",w).attr("height",h);
    var zoom = d3v3.behavior.zoom().scaleExtent([min_zoom,max_zoom])
    var g = svg.append("g")//.attr("transform","translate("+(w/4)+","+(h/4)+")")

    svg.style("cursor","move");

    var totalDiscussions = 0,
        totalReplies = 0,
        totalConnections = 0,
        totalComments = 0;



    d3.json(url1,function(graph){

//d3v3.json("graph.json", function(error, graph) {
        var links=[];
        var centersize=0;
        var centercolor=0;
        for(var i=1;i<graph.nodes.length;i++)
        {
            if(graph.nodes[i].size!='0')
                links.push(
                    {"source": 0,
                        "target": i,
                        "intensity": graph.nodes[i].size})
            if(graph.nodes[i].color!='0')
                links.push(
                    {"source": i,
                        "target": 0,
                        "intensity": graph.nodes[i].color})
            centersize=centersize+(+graph.nodes[i].size);
            centercolor=centercolor+(+graph.nodes[i].color);
        }
        graph.nodes[0].size=centersize;
        graph.nodes[0].color=centercolor;

        // alert(graph.nodes[0].size);
        // alert(graph.nodes[0].color);
        // alert(graph.nodes[7].name);
        var linkedByIndex = {};
        var force = d3v3.layout.force()
            .linkDistance(100)
            .charge(-2000)
            .size([w,h]);
        // console.log(d3.forceManyBody().strength(-100*77/graph.nodes.length));
        // force.charge(-2000)

        links.forEach(function(d) {
            linkedByIndex[d.source + "," + d.target] = true;
        });

        function isConnected(a, b) {
            return linkedByIndex[a.index + "," + b.index] || linkedByIndex[b.index + "," + a.index] || a.index == b.index;
        }

        function hasConnections(a) {
            for (var property in linkedByIndex) {
                s = property.split(",");
                if ((s[0] == a.index || s[1] == a.index) && linkedByIndex[property]) return true;
            }
            return false;
        }


        //set size domain based on input value
        size.domain([1, d3v3.max(graph.nodes, function(d,i) {
            // console.log(d.size+(+d.color))
            if(i==0) return 1;
            else return (+d.size)+(+d.color); })]);



        thickness.domain([1, d3v3.max(links, function(d) {
            // console.log(d.intensity)
            return +d.intensity; })]);

        // collect all the node names for search auto-complete
        for (var i = 0; i < graph.nodes.length; i++) {
            optArray.push(graph.nodes[i].name);
        }
        optArray = optArray.sort();

        // assign number of total discussions
        //totalDiscussions = graph.totalDiscussions;
        //totalComments = graph.totalComments;

        // calculate total replies
        //links.forEach(function(d){totalReplies+=d['value']});

        // calculate total people
        // totalConnections = graph.nodes.length;

        //updateReport();

        // align nodes along a diagonal line to minimize number of iterations
        var n = graph.nodes.length;
        graph.nodes.forEach(function(d, i) {
            d.x = w/2 ;
            d.y =h/2;
        });
        force.nodes(graph.nodes)
            .links(links)
            .start();

        // console.log(links)

// console.log("stt")
        // add lines between people
        var line =d3v3.svg.line().interpolate('basis');


        var link = g.selectAll(".link")
            .data(links)
            .enter()
            .append("path")
            .attr("class", "link")
            .style("stroke-width", function(d){return thickness(+d.intensity)})
            .style("stroke", default_link_color)


        var node = g.selectAll(".node")
            .data(graph.nodes)
            .enter().append("g")
            .attr("class", "node")
            .call(force.drag)
            .on("click",function(d){
                console.log(d.id);
            })


        // add circle clip
        var clipPath = node.append("clipPath")
            .attr("id", function(d){return "clipCircle_" + d.id})
            .append("circle")
            .attr("r", function(d,i){
                return judge_size(+d.size+(+d.color),i)/2});



        var repliesArc = node.append("path")
            .attr("class", "replyPath")
            .style("fill", default_replies_color)
            .style("stroke",function(d){
                if(d.id==zhong){
                    return "#516b91";
                }else{
                    return  "black";
                }
            })
            .style("stroke-width",function(d){
                if(d.id==zhong){
                    return 5;
                }else{
                    return  1;
                }
            })
            .attr("d", d3v3.svg.arc()
                .innerRadius(function(d){return 0})
                .outerRadius(function(d,i){return judge_size(+d.size+(+d.color),i)/2 })
                .startAngle(Math.PI)
                .endAngle(calculateRepliesAngle)
            );

        var commentsArc = node.append("path")
            .attr("class", "commentPath")
            .style("fill", default_comments_color)
            .style("stroke",function(d){
                if(d.id==zhong){
                    return "#516b91";
                }else{
                    return  "black";
                }
            })
            .style("stroke-width",function(d){
                if(d.id==zhong){
                    return 5;
                }else{
                    return  1;
                }
            })
            .attr("d", d3v3.svg.arc()
                .innerRadius(function(d){return 0})
                .outerRadius(function(d,i){return judge_size(+d.size+(+d.color),i)/2 })
                .startAngle(calculateCommentsAngleStart)
                .endAngle(calculateCommentsAngleEnd)
            );

        var text = g.selectAll(".text")
            .data(graph.nodes)
            .enter().append("text")
            .attr("dy", ".35em")
            .attr("class", "text")
            .style("font-size", nominal_text_size + "px");

        if (text_center)
            text.text(function(d) { return d.id; })
                .style("text-anchor", "middle");
        else
            text.attr("dx", function(d,i) {return (judge_size(+d.size+(+d.color),i)/2||nominal_base_node_size);})
                .text(function(d) { return '\u2002'+d.id; });

        /*
          function updateReport(d){
            if (d=== undefined){
              d3v3.select("span#user").text(' . ');
              d3v3.select("span#dCount").text(totalDiscussions);
              d3v3.select("span#rCount").text(totalReplies);
              d3v3.select("span#cCount").text(totalConnections);
                    d3v3.select("span#coCount").text(totalComments);
            }else{
              d3v3.select("span#user").text(d.id + ' > ');
              d3v3.select("span#dCount").text(d.discussions);
              d3v3.select("span#rCount").text(d.replies);
              d3v3.select("span#cCount").text(d.connections);
              d3v3.select("span#coCount").text(d.comments);
            }
          }
          
          */
        //set events
        node
            .on("mouseover", function(d){
                set_focus(d);

            })
            .on("mouseout",function(d){resize_focus(d)})


        // when user has mouse down on one of the circles
        function set_focus(d){
            if (highlight_trans <1){

                //  updateReport(d);
                commentsArc.style("opacity", function(o) {
                    return isConnected(d, o) ? 1 : highlight_trans;
                });

                repliesArc.style("opacity", function(o) {
                    return isConnected(d, o) ? 1 : highlight_trans;
                });


                text.style("opacity", function(o) {
                    return isConnected(d, o) ? 1 : highlight_trans;
                });

                link.style("opacity", function(o) {
                    return o.source.index == d.index || o.target.index == d.index ? 1 : highlight_trans;
                });


            }
        }

        function resize_focus(d){
            commentsArc.style("opacity", function(o) {
                return 1;
            });

            repliesArc.style("opacity", function(o) {
                return 1;
            });


            text.style("opacity", function(o) {
                return 1;
            });

            link.style("opacity", function(o) {
                return 1;
            });
        }

        d3.selectAll("#kaiguan").on("click", function () {
            //  console.log(this)
            // console.log(this.id)
            // console.log(this.name)
            // console.log(this.value)
            // if(this.value==0){
            //     console.log(this.value)
            // }else if(this.value==1){
            //     console.log(this.value)
            // }else{
            //     console.log(this.value)
            // }
            // console.log(this.value);
            resizeNodes(this.value)

        });









        zoom.on("zoom", function() {
            g.attr("transform", "translate(" + d3v3.event.translate + ")scale(" + d3v3.event.scale + ")");
        });


        svg.call(zoom);

        resize();

        d3v3.select(window).on("resize", resize);

        force.on("tick", function() {
            node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
            text.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
            /*  link.attr("x1", function(d) { 
                return d.source.x; })
                .attr("y1", function(d) { return d.source.y; })
                .attr("x2", function(d) { return d.target.x; })
                .attr("y2", function(d) { return d.target.y; });
          */
            link.attr("d",function(d){return line([[d.source.x,d.source.y],[d.target.x,d.target.y]])})

            node.attr("cx", function(d) { return d.x; })
                .attr("cy", function(d) { return d.y; });
        });





        function resize() {

            var width = w, height = h;

            svg.attr("width", width).attr("height", height);

            force.size([force.size()[0]+(width-w)/zoom.scale(),force.size()[1]+(height-h)/zoom.scale()]).resume();

            w = width;

            h = height;
        }

    });

    function calculateRepliesAngle(d){
        var fraction = +d.size/(+d.size+(+d.color));
        return Math.PI + fraction * 2 * Math.PI;
    }

    function calculateCommentsAngleStart(d){
        return calculateRepliesAngle(d);
    }

    function calculateCommentsAngleEnd(d){
        var fraction = +d.color/(+d.size+(+d.color));
        return calculateRepliesAngle(d) + fraction * 2 * Math.PI;
    }


    // // update for resizing nodes
    // d3.select("#circlesize")
    //   .on("change", function(d) {
    //        var sizedBy = d3.select(this).property("value");
    //         resizeNodes(sizedBy);
    //     });

    function resizeNodes(sort){
        nodes = d3.selectAll(".node");

        d3.selectAll(".text")
            .style("opacity",0)

        // console.log(text_1);

        d3.selectAll(".link")
            .style("opacity",0);
        nodes.selectAll(".replyPath")
            .style("opacity",0)
        nodes.selectAll(".commentPath")
            .style("opacity",0)

        if(sort==0){

            nodes.selectAll(".commentPath")
                .filter(function(d) {
                    return d.color!=0; })
                .style("opacity",1)

            d3.selectAll(".link")
                .filter(function(d){
                    return d.source.color!=0&&d.target.color!=0;
                })
                .style("opacity",1);
            d3.selectAll(".text")
                .filter(function(d) {
                    return d.color!=0; })
                .style("opacity",1)

        }else if(sort==1){
            nodes.selectAll(".replyPath")
                .filter(function(d) {
                    return d.size!=0; })
                .style("opacity",1)
            nodes.selectAll(".commentPath")
                .style("opacity",0);


            d3.selectAll(".link")
                .filter(function(d){
                    return d.source.size!=0&&d.target.size!=0;
                })
                .style("opacity",1);

            d3.selectAll(".text")
                .filter(function(d) {
                    return d.size!=0; })
                .style("opacity",1)
        }else{
            nodes.selectAll(".replyPath")
                .style("opacity",1)
            nodes.selectAll(".commentPath")
                .style("opacity",1)
            d3.selectAll(".link")
                .style("opacity",1);
            d3.selectAll(".text")
                .style("opacity",1)
        }
        // add circle clip
        // 
        // console.log(nodes.selectAll("circle"));

        //set size domain based on input value
        //  size.domain([1, d3.max(nodes.data(), function(d) { return +d[parameter]; })]);

        // nodes.selectAll("circle")      
        //   .attr("r", function(d){return size(d[parameter])/2});
        // nodes.selectAll(".replyPath")
        //       .style("opacity",0)
        /* .attr("d", d3.svg.arc()
           .innerRadius(function(d){return size(d[parameter])/2})
           .outerRadius(function(d){return size(d[parameter])/2 + 7})
               .startAngle(Math.PI)
               .endAngle(calculateRepliesAngle));*/
        /*
            nodes.selectAll(".commentPath")
              .attr("d", d3.svg.arc()
                  .innerRadius(function(d){return size(d[parameter])/2})
                  .outerRadius(function(d){return size(d[parameter])/2 + 7})
                  .startAngle(calculateCommentsAngleStart)
                  .endAngle(calculateCommentsAngleEnd)
                 );
          
            d3.selectAll(".text")
              .attr("dx", function(d){return size(d[parameter])/2;});*/

        // force.start();
    }


// assign optArray to search box
// Search box is modified from this post > http://www.coppelia.io/2014/07/an-a-to-z-of-extra-features-for-the-d3v3-force-layout/
// $(function () {
//     $("#search").autocomplete({
//         source: optArray
//     });
// });
    d3.selectAll("#kaiguan").on("click", function () {
        //  console.log(this)
        // console.log(this.id)
        // console.log(this.name)
        // console.log(this.value)
        // if(this.value==0){
        //     console.log(this.value)
        // }else if(this.value==1){
        //     console.log(this.value)
        // }else{
        //     console.log(this.value)
        // }
        // console.log(this.value);
        resizeNodes(this.value)

    });
    d3.select("#search_button").on("click", function () {
        //find the node
        var selectedVal = document.getElementById('search').value;
        if(selectedVal!=""){
            svg.selectAll(".node")
                .filter(function (d) {
                    return d.name != selectedVal;})
                .style("opacity", highlight_trans/2);

        }else{
            svg.selectAll(".node")
                .style("opacity", 1);
        }

        // .transition()
        // 	.duration(15000)
        // 	.style("opacity", 1);

        // svg.selectAll(".link, .text, .replyPath, .commentPath")
        //   .style("opacity", highlight_trans/2);
        // .transition()
        // .duration(5000)
        // .style("opacity", 1);
    });
    d3.select("#clear_button").on("click", function () {
        svg.selectAll(".node")
            .style("opacity", 1);
    });


// function isNumber(n) { return !isNaN(parseFloat(n)) && isFinite(n);}	
}