// Generated by CoffeeScript 1.10.0
(function() {
  var bubble_layer, h, height, line, pack, svg, vis, w, width, zoom, zoomable_layer;

  svg = d3.select('svg');

  width = svg.node().getBoundingClientRect().width;

  height = svg.node().getBoundingClientRect().height;

  zoomable_layer = svg.append('g');

  zoom = d3.zoom().scaleExtent([-Infinity, Infinity]).on('zoom', function() {
    return zoomable_layer.attrs({
      transform: d3.event.transform
    });
  });
  svg.call(zoom);

  vis = zoomable_layer.append('g').attrs({
    transform: "translate(" + (width / 2) + "," + (height / 2) + ")"
  });

  // stratify = d3.stratify().parentId(function(d) {
  //   return d.id.substring(0, d.id.lastIndexOf("."));
  // });

  w = width - 8;

  h = height - 8;

  pack = d3.pack().size([w, h]).padding(50);

  line = d3.line().curve(d3.curveBundle.beta(0.5)).x(function(d) {
    return d.x;
  }).y(function(d) {
    return d.y;
  });
  var line_1 = d3.line().curve(d3.curveBasisClosed).x(function(d) {
    return d[0];
  }).y(function(d) {
    return d[1];
  });
;

  bubble_layer = vis.append('g').attrs({
    transform: "translate(" + (-w / 2) + "," + (-h / 2) + ")"
  });

     d3.csv('/file/link.csv', function(links_data) {
      d3.json('/file/pu.json',function(data1){

    var max_link=3;
    var min_link=1;
    var linear_link = d3.scaleLinear()
        .domain([min_link, max_link])
        .range([2, 8]);
      var bubbles, enb, index, links, root;
    root = d3.hierarchy(data1)
      .sum(function(d) { return d.size; })
      .sort(function(a, b) { return b.value - a.value; });
    pack(root);
      // console.log(root);
      index = {};
      root.eachBefore(function(d) {
        // console.log(d);
        return index[d.data.name] = d;
      });


      links_data.forEach(function(d) {
        d.source = index[d.source];
        d.target = index[d.target];
         // console.log(d.source.x==d.target.x&&d.source.y==d.target.y)
        if(d.source.x==d.target.x&&d.source.y==d.target.y){
          return d.path1 = [[d.source.x,d.source.y],[d.source.x+30,d.source.y],[d.source.x+30,d.source.y+30],[d.source.x,d.source.y]];
        }else{
          return d.path = d.source.path(d.target);
        }

      });

      bubbles = bubble_layer.selectAll('.bubble').data(root.descendants());
      enb = bubbles.enter().append('circle').attrs({
        "class": function(d) {
          // console.log((JSON.stringify(d.data.children) === '[]')? "node" : "leaf node");
          // return (JSON.stringify(d.data.children) === '[]')? "bubble" : "bubble";
          return "bubble";
        },
        cx: function(d) {
          return d.x;
        },
        cy: function(d) {
          return d.y;
        },
        r: function(d) {
          return d.r;
        }
        
      })
      .attr("id",function(d) {
          return "n_"+d.data.name;
        });



      enb.append('title').text(function(d) {
        return d.data.name + "\n" + d.value;
      });

  var text = bubble_layer.selectAll(".text")
      .data(root.descendants())
      .enter().append("text")
      .attr("x", function(d) { return d.x; })
      .attr("y", function(d) { return d.y; })
      .attr("dy", ".35em")
      .attr("dy", ".35em")
      .attr("class", "text")
      .style("font-size", "12px")
      .text(function(d) {
        return (JSON.stringify(d.data.children) === '[]')? d.data.name : null;
      });


      //渐变
      var defs = svg.append("defs");
      var linearGradient1 = defs.append("linearGradient")
                              .attr("id","linearColor1")
                              .attr("x1","0%")
                              .attr("y1","0%")
                              .attr("x2","100%")
                              .attr("y2","0%");

      var stop1a = linearGradient1.append("stop")
                      .attr("offset","0%")
                      .style("stop-color","#f4d03f");
      var stop2a = linearGradient1.append("stop")
                      .attr("offset","100%")
                      .style("stop-color","#16a085");
      links = bubble_layer.selectAll('.link').data(links_data);
      links.enter()
          .append('path')
      .attr("class","link")
      .attr("d",function(d) {
        if(typeof(d.path)!="undefined"){
            return line(d.path);
        } else{
          return line_1(d.path1);
        }
          })
      .style("stroke-width",function(d){
        return linear_link(d.size);
      })
      .style("stroke-style","dotted")
      .style("stroke",function (d) {
        if(typeof(d.path)!="undefined"){
          //  return  "url(#" + linearGradient1.attr("id") + ")";//"#516b91";   //#93b7e3 rgb(60,120,205)
          return "#516b91"; 
        } else{
          return "#C174FE";  //red   #d0648a  #516b91
        }
      })
      .on("mouseover",function(d){
        // console.log("#n_"+d.source.data.name);
        d3.select("#n_"+d.source.data.name)
          .style("fill","#f4d03f")//"#edafda"); //orange
        d3.select("#n_"+d.target.data.name)
          .style("fill","#16a085")//"#a5e7f0");
        d3.select(this)
          .style("stroke-width",function(d) { return linear_link(d.size)+3; })
        //  .style("stroke","#32a487");  //线
      })
      .on("mouseout",function(d){
        d3.select(this)
          .style("stroke-width",function(d) { return linear_link(d.size); })
        //  .style("stroke","#516b91"); //#59c4e6  93b7e3
        d3.select("#n_"+d.source.data.name)
          .style("fill","rgba(10,70,0,0.1)");
        d3.select("#n_"+d.target.data.name)
          .style("fill","rgba(10,70,0,0.1)");
      });

    });
  });

}).call(this);