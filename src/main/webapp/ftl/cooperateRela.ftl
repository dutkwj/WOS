<html>
<head>
    <meta charset="utf-8">
    <title>Force</title>
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

    </style></head>

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

    nodes = [
        { "name": "云天河"   , "image" : "../img/b.jpg" },
        { "name": "韩菱纱"   , "image" : "../img/b.jpg" },
        { "name": "柳梦璃"   , "image" : "../img/b.jpg" }
    ];
    edges = [
        { "source": 0 , "target": 1 , "relation":"挚友" },
        { "source": 0 , "target": 2 , "relation":"挚友" }
    ];



    //D3力导向布局
    var force = d3.layout.force()
            .nodes(nodes)
            .links(edges)
            .size([width,height])
            .linkDistance(200)
            .charge(-1500)
            .start();

    //边
    var edges_line = svg.selectAll("line")
            .data(edges)
            .enter()
            .append("line")
            .style("stroke","#ccc")
            .style("stroke-width",1);

    //边上的文字（人物之间的关系）
    var edges_text = svg.selectAll(".linetext")
            .data(edges)
            .enter()
            .append("text")
            .attr("class","linetext")
            .text(function(d){
                return d.relation;
            });


    // 圆形图片节点（人物头像）
    var nodes_img = svg.selectAll("image")
            .data(nodes)
            .enter()
            .append("circle")
            .attr("class", "circleImg")
            .attr("r", radius)
            .attr("fill", function(d, i){

                //创建圆形图片
                var defs = svg.append("defs").attr("id", "imgdefs")

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

    var nodes_text = svg.selectAll(".nodetext")
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

</script>

</body>
</html>