<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <title>teacher student relationship</title>

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
    $("#statisticalNumber").html("Students number:${middleScholar.studentsNumber!""}");

    nodes = [
        { "name": "${middleScholar.name!""}"   , "image" : "../img/scholarImg.png" , "id":"${middleScholar.index!""}", "hindex":"${middleScholar.hindex!""}", "qindex":"${middleScholar.qindex!""}", "studentsNumber":"${middleScholar.studentsNumber!""}", "aff":"${middleScholar.aff!""}", "fieldName":"${middleScholar.fieldName!""}"}];
    edges = [];
    var cooperaterIndex = 1;
    <#if students?? && (students?size>0)>
        <#list students as student>
        nodes.push({"name": "${student.name!""}"   , "id":"${student.index!""}", "hindex":"${student.hindex!""}", "qindex":"${student.qindex!""}", "studentsNumber":"${student.studentsNumber!""}", "aff":"${student.aff!""}", "fieldName":"${student.fieldName!""}"});
        edges.push({ "source": 0 , "target": cooperaterIndex , "relation":"student", "intension":1, "color":"#ccc"});
        cooperaterIndex = cooperaterIndex + 1;

        </#list>
    </#if>
    <#if teacher?exists>
    nodes.push({"name": "${teacher.name!""}"   ,  "id":"${teacher.index!""}", "aff":"${teacher.aff!""}"});
    edges.push({ "source": 0 , "target": cooperaterIndex , "relation":"teacher", "intension":2, "color":"red"});
    </#if>

    var oParentWin= (window.parent)?(window.parent):(window.__parent__);
    var oParentBody= oParentWin.document.body;

    var width = oParentBody.clientWidth;

    var h = 0;
    if (cooperaterIndex > 20) {
        h = (cooperaterIndex - 20) * 7;
    }
    var height = oParentBody.clientHeight + h;
    var img_w = 77;
    var img_h = 80;
    var radius = 30;    //圆形半径
    //创建SVG
    var svg = d3.select("body").append("svg")
            .attr("width",width)
            .attr("height",height);
    var g1 = svg.append("g");

            .on("click", function (d) {
                $.get('/TeaStuRela/'+ d.id, function (result) {
                    $("svg").attr("width", 0);
                    $("svg").attr("height", 0);
                    $("#content").html(result);
                    $("#middleScholarName").html(d.name);
                    $("#middleScholarIndex").attr("value", d.id);
                    $("#middleScholarHindex").html(d.hindex);
                    $("#middleScholarQindex").html(d.qindex);
                    $("#statisticalNumber").html("Students number:"+d.studentsNumber);
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

<script src="../js/d3.v3.min.js"></script>
<script src="../js/d3.geo.projection.v0.min.js"></script>
<script src="../js/topojson.v1.min.js"></script>
</body>
</html>