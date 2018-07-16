

////绘制地图
	var svg_map=d3.select("#time_map")
			  .append("svg")
			  .attr("width","100%")
			  .attr("height","100%")

	var width=960,height=500;
	var projection = d3.geoMercator();

	var path = d3.geoPath()
		 .projection(cylindrical(width, height));

	function cylindrical(width, height) {
	  return d3.geoProjection(function(λ, φ) { return [λ, φ * 2 / width * height]; })
	      .scale(width / 2 / Math.PI)
	      .translate([width / 2, height / 2]);
	}

	var url = "/file/world-50m.json";

	let mapG = svg_map.append('g');
	let map = svg_map.append('g').attr("id","map");

	d3.json(url, function(error, world) {
			if (error) throw error;
			
		
		mapG.append("path")
		  .datum(topojson.feature(world, world.objects.land))
		  .attr("class", "land")
		  .attr("d", path)
		  .style("fill","#ccc");

		mapG.append("path")
		  .datum(topojson.mesh(world, world.objects.countries, function(a, b) { return a !== b; }))
		  .attr("class", "country-border")
		  .attr("d", path)
		  .style("fill","none")
		  .style("stroke","#fff");

		let trans = {};


		let zoom = d3.zoom()
			.scaleExtent([1, 8])
			.on("zoom", function () {
				trans["stroke-width"] = 1.5 / d3.event.transform.k + "px";
				trans["transform"]= d3.event.transform;

				mapG.style("stroke-width", trans["stroke-width"]);
				mapG.attr("transform", trans["transform"]);

				map.style("stroke-width", trans["stroke-width"]);
				map.attr("transform", trans["transform"]);
			});
		svg_map.call(zoom);

	})

	///绘制散点
// d3.request('/cooperate/${scholarId!""}/worldMap',function (err, response) {
 
	///读取无表头csv
	// var dirtyCSV = response.responseText;
	// var cleanCSV = dirtyCSV.split('\n').slice(0).join('\n');
	// cleanCSV="id,value\n"+cleanCSV;  ////加入表头
	// var parsedCSV = d3.csvParse(cleanCSV);



	//当前学者位置
	var cur_author={
		// id:parsedCSV[0].id.split("(")[0],
		// location:[Math.abs(parseFloat(parsedCSV[0].id.split("(")[1].split(")")[0].split(" ")[1])),Math.abs(parseFloat(parsedCSV[0].id.split("(")[1].split(")")[0].split(" ")[0]))]
		id:scholarId,
		location:places[scholarId]
	}
// alert(places[scholarId]);

	///其他学者位置，year存放年份或者ALL，value存放位置
	// var author_location_time=[];//其他学者每年的位置
	// var author_location_all=[]; ///其他学者所有的位置
	// var other_dirty=parsedCSV[0].value.split("[")[1].split("]")[0].split(",")
	// for(var i=0;i<other_dirty.length;i++)
	// {
	// 	time_location_data.push(other_dirty[i].split("(")[0].split("'")[1])
    // for(var i = 0;i < cooperateyear.length;i++){
     //    time_location_data.push(cooperateyear[i])
	// // }
	// }
	for(var i = 0;i < cooperateyear.length;i++){
		time_location_data.push(cooperateyear[i])
	}
// alert(time_location_data);
	// for(var i = 0;i < yearcooperater.length;i++){
    //
     //    author_location_time.push(
     //        {
     //            // year:other_dirty[i].split("(")[0].split("'")[1],
     //            // value:get_authorlocation(other_dirty[i])
     //            year: yearcooperateryear[yearcooperater[i]],
     //            value: places[yearcooperater[i]]
     //        }
     //    )
     //    author_location_all.push(places[yearcooperater[i]])
	// }



	// function get_authorlocation(d)
	// {
	// 	var result=[];
	// 	d=d.split("(")[1].split(")")[0].split("/")
	// 	for(var k=0;k<d.length;k++)
	// 	{
	// 		result.push([Math.abs(parseFloat(d[k].split(" ")[1])),Math.abs(parseFloat(d[k].split(" ")[0]))])
	// 		author_location_all.push([Math.abs(parseFloat(d[k].split(" ")[1])),Math.abs(parseFloat(d[k].split(" ")[0]))])
	// 	}
	// 	return result;
	// }



draw_nodelink("ALL")

	function draw_nodelink(nowtime)
	{
		d3.selectAll("#maps").remove()

		var maps=map.append("g").attr("id","maps")

		var author_location_now;
		author_location_time.forEach(function(d){
			if(nowtime==d.year) author_location_now=d.value;
            // alert(d.value);
		})



		///绘制散点
		maps.append("circle")
		.attr("cx", projection(cur_author.location)[0])
		.attr("cy", projection(cur_author.location)[1])
		.attr("r", 5)
		.style("fill", "red")
		.style("opacity",1);

		maps.selectAll(".other")
			.data(author_location_now)
			.enter()
			.append("circle")
			.attr("cx", function(d,i){return projection(d)[0]})
		.attr("cy", function(d,i){return projection(d)[1]})
		.attr("r", 2)
		.style("fill", "yellow")
		.style("opacity",1)
		//.style("stroke-width",0);



		///绘制连线

		//处理数据
		var node_data={};
		var edge_data=[];
		node_data[0]={'x':projection(cur_author.location)[0],'y':projection(cur_author.location)[1]};
		author_location_now.forEach(function(d,i){
			node_data[i+1]={'x':projection(d)[0],'y':projection(d)[1]};
			edge_data.push({'source':0,'target':i+1});
		})

		var fbundling = d3.ForceEdgeBundling()
					.step_size(0.2)
					.compatibility_threshold(0.4)
					.nodes(node_data)
					.edges(edge_data);
		var results = fbundling();	
		var d3line = d3.line()
				     .x(function(d){ return d.x; })
		             .y(function(d){ return d.y; })
		             .curve(d3.curveCatmullRom.alpha(0.5));


		//渐变
		var defs = svg_map.append("defs");  
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

		///画线
	 	results.forEach(function(edge_subpoint_data){

	    	maps.append("path")
	    	.attr("d", d3line(edge_subpoint_data))
	        	.attr("stroke",function(){
						return  "url(#" + linearGradient1.attr("id") + ")"//"black"//d3.interpolateBlues(lineScale(b));
					})
					.style("stroke-width", 2)
	            .style("stroke-opacity", 0.5)
	        	.style("fill", "none")
	            	
	    });

 	}



// d3.request('/file/cs_author_time_paper_number.csv',function (err, response1) {

	///读取无表头csv
	// var dirtyCSV1 = response1.responseText.split("[")[1].split("]")[0].split(",");
	// for(var i=0;i<paperyear;i++)
	// {
	// 	// paper_number.push([dirtyCSV1[i].split("'")[1].split(":")[0],dirtyCSV1[i].split("'")[1].split(":")[1]])
	// 	// time_axis_data.push(dirtyCSV1[i].split("'")[1].split(":")[0])
	// 	paper_number.push(paperyear,yearpapernumber[paperyear])
	// 	time_axis_data.push(paperyear)
	// }
// d3.request('/file/cs_author_time_conumber.csv',function (err, response2) {
// 	var dirtyCSV2 = response2.responseText.split("[")[1].split("]")[0].split(",");
// 	for(var i=0;i<coNumyear;i++)
// 	{
// 		// author_number.push([dirtyCSV2[i].split("'")[1].split(":")[0],dirtyCSV2[i].split("'")[1].split(":")[1]])
// 		author_number.push(coNumyear,yearConumbers[coNumyear])
// 		//// bili_number.push([dirtyCSV2[i].split("'")[1].split(":")[0],dirtyCSV2[i].split("'")[1].split(":")[1]/dirtyCSV1[i].split("'")[1].split(":")[1]])
// 	}
// d3.request('/file/cs_author_time_coauthor3.csv',function (err, response3) {
// 	var tempstart=response3.responseText.indexOf("[")+1
// 	var tempend=response3.responseText.lastIndexOf("]")
// 	var dirtyCSV3 = response3.responseText.substring(tempstart,tempend).split(",");

	// for(var i=0;i<yearcooperaterid.length;i++)
	// {
	// 	coauthor_times.push(dirtyCSV3[i].split("[")[1].split("]")[0].split("."))
	// 	time_coauthortimes_data.push(cooperateyear)
	// }

////////////////////////时序图
var myCharttime = echarts.init(document.getElementById('timechart'),'walden');
var optionsData=[];
for(var i=0;i<time_axis_data.length;i++)
{
	var flag=-1;
	for(var j=0;j<time_coauthortimes_data.length;j++)
		if(time_coauthortimes_data[j]==time_axis_data[i]) {flag=j;break;}

	if(flag!=-1)
	{
		optionsData.push({
        series : [
	        {name: '合作次数',
			data:getPieData(flag)
	        }
        ]
    })
	}

	else{
		optionsData.push({
        series : [
	        {name: '合作次数',
			data:[]
	        }
        ]
    })
	}

}


function getPieData(index)
{

	var data=[];
	for(var i=0;i<coauthor_times[index].length;i++)
	{
		data.push(
		{
			value:1,
			name:coauthor_times[index][i]
		})
	}
	return data;
}


option = {
	baseOption:{
	    title:
	    {
	        text:'',
	        top: 'bottom',
	        left:'center'
	    },
	    tooltip : {
	       /* trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
	        formatter:function(params){
	        	return params[0].axisValue+"：</br>"+params[0].seriesName+":"+params[0].data[1]+"</br>"+params[1].seriesName+":"+params[1].data[1];
	        }*/
	    },
	    legend: {
	        data:['论文数量','合作者数量']
	    },
	    grid: {
	        left: '7%',
	        right: '7%',
	        bottom: '13%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data :time_axis_data
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : [
	        {
	        name: '论文数量',
	        type: 'line',
	        label: {

	            normal: {
	                show: false,
	                position: 'top',
	            }
	        },

	        lineStyle: {
	            normal: {
	                width: 5,
	                shadowColor: 'rgba(0,0,0,0.4)',
	                shadowBlur: 10,
	                shadowOffsetY: 10,
	                color:"#7B920A"
	            }
	        },
	           itemStyle: {
	            normal: {
	                width: 5,
	                shadowColor: 'rgba(0,0,0,0.4)',
	                shadowBlur: 10,
	                shadowOffsetY: 10,
	                color:"#7B920A"
	            }
	        },
	        symbolSize:6,

	        markPoint : {
	                data : [
	                    {type : 'max', name : '最大值'},

	                ],


            	},
            	markLine : {
                	data : [
                    	{type : 'average', name : '平均值'}
                	]
            	},
	        data: paper_number
	    },
	        {
	            name:'合作者数量',
	            type:'bar',
	            stack:'品牌',
	            itemStyle:{
           			 normal:{color:'#EBA954'},
        		},
        		 markPoint : {
	                data : [
	                    {type : 'max', name : '最大值'},

	                ]
            	},
            	markLine : {
                	data : [
                    	{type : 'average', name : '平均值'}
                	]
            	},
	            label: {

		            normal: {
		                show: false,
		                position: 'top',
		                formatter:function(params){ return params.data[1];},
		            }
	        	},
	            data:author_number,
	             "itemStyle": {
            "normal": {
                "color": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    "offset": 1,
                    "color": "#F9D423" // 0% 处的颜色
                }, {
                    "offset": 0,
                    "color": "#FF4E50" // 100% 处的颜色
                }], false)
            }
        }
	        },
	        {name: '合作次数',
        type: 'pie',
        center: ['35%', '35%'],
        radius: '28%',

        }

	    ],
	     timeline: {
	     		axisType:'category',
                data: time_axis_data
            },
	},
	options:optionsData

};


//setOption
myCharttime.setOption(option);


myCharttime.on('timelinechanged', function (timeLineIndex) {
    // 设置 每个series里的xAxis里的值
    var arrIndex = parseInt(timeLineIndex.currentIndex);


var flag=-1;
for(var j=0;j<time_location_data.length;j++)
{

		if(time_location_data[j]==time_axis_data[arrIndex]) {flag=j;break;}
}
if(flag!=-1)draw_nodelink(time_location_data[flag])
	else d3.selectAll("#maps").remove()

});








/*


 //添加连线
 function drawData(author_location_all, cur_author) {
  // setup and start edge bundling
  var bundle = generateSegments(author_location_all, cur_author.location);


  var line = d3.line()
    .curve(d3.curveBundle)
    .x(function(d) { return d.x; })
    .y(function(d) { return d.y; });

  var links = svg_map.append("g").attr("id", "flights")
    .selectAll("path.flight")
    .data(bundle.paths)
    .enter()
    .append("path")
    .attr("d", line)
    .style("fill", "none")
    .style("stroke", "#252525")
    .style("stroke-width", 2.5)
    .style("stroke-opacity", 0.5);

  // https://github.com/d3/d3-force
  var layout = d3.forceSimulation()
    // settle at a layout faster
    .alphaDecay(0.1)
    // nearby nodes attract each other
    .force("charge", d3.forceManyBody()
      .strength(10)
      .distanceMax(radius.max * 2)
    )
    // edges want to be as short as possible
    // prevents too much stretching
    .force("link", d3.forceLink()
      .strength(0.8)
      .distance(0)
    )
    .on("tick", function(d) {
      links.attr("d", line);
    })
    .on("end", function(d) {
      console.log("Layout complete!");
    });

  layout.nodes(bundle.nodes).force("link").links(bundle.links);


}


var bundle= generateSegments(author_location_all, cur_author.location)
console.log(bundle)





function generateSegments(nodes, cur_author) {

	//nodes 放其他作者的位置，cur_author放当前作者的位置
  // calculate distance between two nodes
  var distance = function(source, target) {
    // sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
    var dx2 = Math.pow(target.x - source.x, 2);
    var dy2 = Math.pow(target.y - source.y, 2);

    return Math.sqrt(dx2 + dy2);
  };

  // max distance any two nodes can be apart is the hypotenuse!
  var hypotenuse = Math.sqrt(width * width + height * height);

  // number of inner nodes depends on how far nodes are apart
  var inner = d3.scaleLinear()
    .domain([0, hypotenuse])
    .range([1, 15]);

  // generate separate graph for edge bundling
  // nodes: all nodes including control nodes
  // links: all individual segments (source to target)
  // paths: all segments combined into single path for drawing
  var bundle = {nodes: [], links: [], paths: []};


  //其他作者、当前作者经纬度转坐标
  bundle.nodes = nodes.map(function(d, i) {
    return {x:projection(d)[0],y:projection(d)[1]}
  });
  cur_author_source={x:projection(cur_author)[0],y:projection(cur_author)[1]};


  //构建边集
  var links=[];
  bundle.nodes.forEach(function(d,i){
  	links.push({
  		source:cur_author_source,
  		target:d,
  		index:i
  	})
  })


  //构建bundle，将link分段
  links.forEach(function(d, i) {
    // calculate the distance between the source and target
    var length = distance(d.source, d.target);

    // calculate total number of inner nodes for this link
    var total = Math.round(inner(length));

    // create scales from source to target
    var xscale = d3.scaleLinear()
      .domain([0, total + 1]) // source, inner nodes, target
      .range([d.source.x, d.target.x]);

    var yscale = d3.scaleLinear()
      .domain([0, total + 1])
      .range([d.source.y, d.target.y]);

    // initialize source node
    var source = d.source;
    var target = null;

    // add all points to local path
    var local = [source];

    for (var j = 1; j <= total; j++) {
      // calculate target node
      target = {
        x: xscale(j),
        y: yscale(j)
      };

      local.push(target);
      bundle.nodes.push(target);

      bundle.links.push({
        source: source,
        target: target
      });

      source = target;
    }

    local.push(d.target);

    // add last link to target node
    bundle.links.push({
      source: target,
      target: d.target
    });

    bundle.paths.push(local);
  });
  
  return bundle;
}

*/
// })
// })
// })
// })