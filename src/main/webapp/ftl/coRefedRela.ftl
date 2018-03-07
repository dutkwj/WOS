<html>
<head>
    <meta charset="utf-8">
    <title>common referenced relationship</title>

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
    $("#statisticalNumber").html("Common referenced number:${middleScholar.coRefedNumber!""}");

    nodes = [
        { "name": "${middleScholar.name!""}"   , "image" : "../img/scholarImg.png" , "id":"${middleScholar.index!""}", "hindex":"${middleScholar.hindex!""}", "qindex":"${middleScholar.qindex!""}", "coRefedNumber":"${middleScholar.coRefedNumber!""}", "aff":"${middleScholar.aff!""}", "fieldName":"${middleScholar.fieldName!""}"}];
    edges = [];
    var coRefedIndex = 1;
    <#if coRefedScholars?? && (coRefedScholars?size>0)>
        <#list coRefedScholars as coRefedScholar>
        nodes.push({"name": "${coRefedScholar.name!""}"   , "image" : "../img/scholarImg.png", "id":"${coRefedScholar.index!""}", "hindex":"${coRefedScholar.hindex!""}", "qindex":"${coRefedScholar.qindex!""}", "coRefedNumber":"${coRefedScholar.coRefedNumber!""}", "aff":"${coRefedScholar.aff!""}", "fieldName":"${coRefedScholar.fieldName!""}"});
        edges.push({ "source": 0 , "target": coRefedIndex , "relation":"共同被引关系" , "count":${coRefedScholar.count}});
        coRefedIndex = coRefedIndex + 1;
        </#list>
    </#if>
    var oParentWin= (window.parent)?(window.parent):(window.__parent__);
    var oParentBody= oParentWin.document.body;

    var width = oParentBody.clientWidth;
    var h = 0;
    if (coRefedIndex > 20) {
        h = (coRefedIndex - 20) * 6;
    }
    var height = oParentBody.clientHeight + h;
    var img_w = 77;
    var img_h = 80;
    var radius = 30;    //圆形半径

    var svg = d3.select("body").append("svg")
            .attr("width",width)
            .attr("height",height);
    var g1 = svg.append("g");

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
                var defs = g1.append("defs").attr("id", "imgdefs");

                var catpattern = defs.append("pattern")
                        .attr("id", "catpattern" + i)
                        .attr("height", 1)
                        .attr("width", 1);

                catpattern.append("image")
                        .attr("x", - (img_w / 2 - radius))
                        .attr("y", - (img_h / 2 - radius))
                        .attr("width", img_w)
                        .attr("height", img_h)
                        .attr("xlink:href", d.image);

                return "url(#catpattern" + i + ")";

            })
            .on("mouseover",function(d,i){
                //显示连接线上的文字
                edges_text.style("fill-opacity",function(edge){
                    if( edge.source === d || edge.target === d ){
                        return 1.0;
                    }
                });
                nodes_img.style("cursor", "hand");
            })
            .on("mouseout",function(d,i){
                //隐去连接线上的文字
                edges_text.style("fill-opacity",function(edge){
                    if( edge.source === d || edge.target === d ){
                        return 0.0;
                    }
                });
            })
            .on("click", function (d) {
                $.get('/reference/coRefed/'+ d.id, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                    $("#middleScholarName").html(d.name);
                    $("#middleScholarIndex").attr("value", d.id);
                    $("#middleScholarHindex").html(d.hindex);
                    $("#middleScholarQindex").html(d.qindex);
                    $("#statisticalNumber").html("Common referenced number:"+d.coRefedNumber);
                    $("#middleScholarAff").html(d.aff);
                    $("#middleScholarFieldName").html(d.fieldName);
                })
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
        nodes.forEach(function(d,i){
            d.x = d.x - img_w/2 < 0     ? img_w/2 : d.x ;
            d.x = d.x + img_w/2 > width ? width - img_w/2 : d.x ;
            d.y = d.y - img_h/2 < 0      ? img_h/2 : d.y ;
            d.y = d.y + img_h/2 + text_dy > height ? height - img_h/2 - text_dy : d.y ;
        });

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