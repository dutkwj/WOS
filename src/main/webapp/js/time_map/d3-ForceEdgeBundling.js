/* 
 FDEB algorithm implementation [www.win.tue.nl/~dholten/papers/forcebundles_eurovis.pdf].

 Author: Corneliu S. (github.com/upphiminn)
 2013

 */
(function () {
	d3.ForceEdgeBundling = function () {
		var data_nodes = {}, // {'nodeid':{'x':,'y':},..}
			data_edges = [], // [{'source':'nodeid1', 'target':'nodeid2'},..]
			compatibility_list_for_edge = [],//每条边与它可绑定的边
			subdivision_points_for_edge = [],//每条边的控制点 包括起点和终点
			K = 0.01, // global bundling constant controlling edge stiffness
			S_initial = 0.1, // init. distance to move points步长
			P_initial = 1, // init. subdivision number控制点个数，即分的段数-1
			P_rate = 2, // subdivision rate increase控制点个数增加速度
			C = 6, // number of cycles to perform模拟次数
			I_initial = 90, // init. number of iterations for cycle迭代次数
			I_rate = 0.6666667, // rate at which iteration number decreases i.e. 2/3迭代次数减速
			compatibility_threshold = 0.6,//合适性阈值
			l=S_initial/2,
			eps = 1e-6;



		/*** Geometry Helper Methods ***/
		function vector_dot_product(p, q) {//点乘，pq是两个点
			return p.x * q.x + p.y * q.y;
		}

		function edge_as_vector(P) {//构造边向量，p是edge的下标
			return {
				'x': data_nodes[P.target].x - data_nodes[P.source].x,
				'y': data_nodes[P.target].y - data_nodes[P.source].y
			}
		}

		function edge_length(e) {//边长,e是edge的下标
			// handling nodes that are on the same location, so that K/edge_length != Inf
			if (Math.abs(data_nodes[e.source].x - data_nodes[e.target].x) < eps &&
				Math.abs(data_nodes[e.source].y - data_nodes[e.target].y) < eps) {
				return eps;
			}

			return Math.sqrt(Math.pow(data_nodes[e.source].x - data_nodes[e.target].x, 2) +
				Math.pow(data_nodes[e.source].y - data_nodes[e.target].y, 2));
		}

		function custom_edge_length(e) {////？？？？？？？？
			return Math.sqrt(Math.pow(e.source.x - e.target.x, 2) + Math.pow(e.source.y - e.target.y, 2));
		}

		function edge_midpoint(e) {//求边的中点，e是edge的下标
			var middle_x = (data_nodes[e.source].x + data_nodes[e.target].x) / 2.0;
			var middle_y = (data_nodes[e.source].y + data_nodes[e.target].y) / 2.0;

			return {
				'x': middle_x,
				'y': middle_y
			};
		}

		function compute_divided_edge_length(e_idx) {///计算分割后边的长度，所有控制点和它前一个的距离，加和，折线距离
			var length = 0;

			for (var i = 1; i < subdivision_points_for_edge[e_idx].length; i++) {
				var segment_length = euclidean_distance(subdivision_points_for_edge[e_idx][i], subdivision_points_for_edge[e_idx][i - 1]);
				length += segment_length;
			}

			return length;
		}

		function euclidean_distance(p, q) {//计算欧式距离
			return Math.sqrt(Math.pow(p.x - q.x, 2) + Math.pow(p.y - q.y, 2));
		}

		function project_point_on_line(p, Q) {/////????????
			var L = Math.sqrt((Q.target.x - Q.source.x) * (Q.target.x - Q.source.x) + (Q.target.y - Q.source.y) * (Q.target.y - Q.source.y));
			var r = ((Q.source.y - p.y) * (Q.source.y - Q.target.y) - (Q.source.x - p.x) * (Q.target.x - Q.source.x)) / (L * L);

			return {
				'x': (Q.source.x + r * (Q.target.x - Q.source.x)),
				'y': (Q.source.y + r * (Q.target.y - Q.source.y))
			};
		}

		/*** ********************** ***/

		/*** Initialization Methods ***/
		function initialize_edge_subdivisions() {////构建初始控制点数组，若为1，控制点数组为空，否则放入起点和终点 直接是xy
			for (var i = 0; i < data_edges.length; i++) {
				if (P_initial === 1) {
					subdivision_points_for_edge[i] = []; //0 subdivisions
				} else {
					subdivision_points_for_edge[i] = [];
					subdivision_points_for_edge[i].push(data_nodes[data_edges[i].source]);
					subdivision_points_for_edge[i].push(data_nodes[data_edges[i].target]);
				}
			}
		}

		function initialize_compatibility_lists() {/////构建初始合适性列表，每条边有一个自己的列表，开始为空
			for (var i = 0; i < data_edges.length; i++) {
				compatibility_list_for_edge[i] = []; //0 compatible edges.
			}
		}

		function filter_self_loops(edgelist) {/////筛选列表，去掉自己重合的边，去掉起点和终点的一样的边
			var filtered_edge_list = [];

			for (var e = 0; e < edgelist.length; e++) {
				if (data_nodes[edgelist[e].source].x != data_nodes[edgelist[e].target].x ||
					data_nodes[edgelist[e].source].y != data_nodes[edgelist[e].target].y) { //or smaller than eps
					filtered_edge_list.push(edgelist[e]);
				}
			}

			return filtered_edge_list;
		}

		/*** ********************** ***/

		/*** Force Calculation Methods ***/
		function apply_spring_force(e_idx, i, kP) {///////计算弹簧力，e_idx是第几条边，i是第几个控制点，kp是弹力系数
			var prev = subdivision_points_for_edge[e_idx][i - 1];//////前一个控制点
			var next = subdivision_points_for_edge[e_idx][i + 1];//////后一个控制点
			var crnt = subdivision_points_for_edge[e_idx][i];/////当前控制点
			var x = prev.x - crnt.x + next.x - crnt.x;/////x方向的位移
			var y = prev.y - crnt.y + next.y - crnt.y;//////y方向的位移

			x *= kP;
			y *= kP;

			return {
				'x': x,////x方向弹簧力给的位移
				'y': y/////y方向弹簧力给的位移
			};
		}

		function apply_electrostatic_force(e_idx, i,S,l) {///////计算库仑力，e_idx是第几条边，i是第几个控制点，s????????/
			//console.log("111")
			var sum_of_forces = {
				'x': 0,
				'y': 0
			};
			var compatible_edges_list = compatibility_list_for_edge[e_idx];///该条边合适的边

			for (var oe = 0; oe < compatible_edges_list.length; oe++) {
				//如果同向 oe是第几条边 i是第几个控制点 要找到每个边的起点终点 第compatible_edges_list[oe]]条边
				if(vector_dot_product(edge_as_vector(data_edges[compatible_edges_list[oe]]),edge_as_vector(data_edges[e_idx]))>0)
				//if((data_nodes[data_edges[compatible_edges_list[oe]].source].x*data_nodes[data_edges[e_idx].source].x+data_nodes[data_edges[compatible_edges_list[oe]].source].y*data_nodes[data_edges[e_idx].source].y)>0)
				{
					var force = {
					'x': subdivision_points_for_edge[compatible_edges_list[oe]][i].x - subdivision_points_for_edge[e_idx][i].x,
					'y': subdivision_points_for_edge[compatible_edges_list[oe]][i].y - subdivision_points_for_edge[e_idx][i].y
					};///求两个控制点的距离

					if ((Math.abs(force.x) > eps) || (Math.abs(force.y) > eps)) {//////如果xy都不重合，因为0不能做分母
						var diff = (1 / Math.pow(custom_edge_length({
						'source': subdivision_points_for_edge[compatible_edges_list[oe]][i],
						'target': subdivision_points_for_edge[e_idx][i]
						}), 1));////计算两个控制点距离，1是1次方，可以改成2次方

						sum_of_forces.x += force.x * diff;
						sum_of_forces.y += force.y * diff;
					}
				}
				else{
 					

					var tj={
						'x':(subdivision_points_for_edge[compatible_edges_list[oe]][i+1].x-subdivision_points_for_edge[compatible_edges_list[oe]][i+1].x)/custom_edge_length({
							'source':subdivision_points_for_edge[compatible_edges_list[oe]][i+1],
							'target':subdivision_points_for_edge[compatible_edges_list[oe]][i-1]
						}),
						'y':subdivision_points_for_edge[compatible_edges_list[oe]][i+1].y-subdivision_points_for_edge[compatible_edges_list[oe]][i+1].y/custom_edge_length({
							'source':subdivision_points_for_edge[compatible_edges_list[oe]][i+1],
							'target':subdivision_points_for_edge[compatible_edges_list[oe]][i-1]
						})
					}

					var nj={
						'x':tj.y,
						'y':-tj.x
					}

					var qj={
						'x':subdivision_points_for_edge[compatible_edges_list[oe]][i].x+nj.x*l,
						'y':subdivision_points_for_edge[compatible_edges_list[oe]][i].y+nj.y*l
					}

					/*var temp=subdivision_points_for_edge[oe].length;
					var force = {
					'x': subdivision_points_for_edge[compatible_edges_list[oe]][temp-i-1].x - subdivision_points_for_edge[e_idx][i].x,
					'y': subdivision_points_for_edge[compatible_edges_list[oe]][temp-i-1].y - subdivision_points_for_edge[e_idx][i].y
					};
					if ((Math.abs(force.x) > eps) || (Math.abs(force.y) > eps)) {
						var diff = (1 / Math.pow(custom_edge_length({
						'source': subdivision_points_for_edge[compatible_edges_list[oe]][temp-i-1],
						'target': subdivision_points_for_edge[e_idx][i]
						}), 1));

						sum_of_forces.x += force.x * diff;
						sum_of_forces.y += force.y * diff;
					}*/
					var force = {
					'x': qj.x - subdivision_points_for_edge[e_idx][i].x,
					'y': qj.y - subdivision_points_for_edge[e_idx][i].y
					};
					if ((Math.abs(force.x) > eps) || (Math.abs(force.y) > eps)) {
						var diff = (1 / Math.pow(custom_edge_length({
						'source': qj,
						'target': subdivision_points_for_edge[e_idx][i]
						}), 1));

						sum_of_forces.x += force.x * diff;
						sum_of_forces.y += force.y * diff;
					}


				}

				/*var force = {
					'x': subdivision_points_for_edge[compatible_edges_list[oe]][i].x - subdivision_points_for_edge[e_idx][i].x,
					'y': subdivision_points_for_edge[compatible_edges_list[oe]][i].y - subdivision_points_for_edge[e_idx][i].y
					};

					if ((Math.abs(force.x) > eps) || (Math.abs(force.y) > eps)) {
						var diff = (1 / Math.pow(custom_edge_length({
						'source': subdivision_points_for_edge[compatible_edges_list[oe]][i],
						'target': subdivision_points_for_edge[e_idx][i]
						}), 1));

						sum_of_forces.x += force.x * diff;
						sum_of_forces.y += force.y * diff;
					}*/
			
			
			}
			return sum_of_forces;
		}


		function apply_resulting_forces_on_subdivision_points(e_idx, P, S) {//计算合力
			var kP = K / (edge_length(data_edges[e_idx]) * (P+1)); // kP=K/（|P|*(number of segments)）, where |P| is the initial length of edge P.
			// (length * (num of sub division pts - 1)) 边的长度*段的个数 +1？？？？？？？？？？？？
			var resulting_forces_for_subdivision_points = [{
				'x': 0,
				'y': 0
			}];

			for (var i = 1; i < P + 1; i++) { // exclude initial end points of the edge 0 and P+1
				var resulting_force = {
					'x': 0,
					'y': 0
				};

				spring_force = apply_spring_force(e_idx, i, kP);
				electrostatic_force = apply_electrostatic_force(e_idx, i, S);

				resulting_force.x = S * (spring_force.x + electrostatic_force.x);
				resulting_force.y = S * (spring_force.y + electrostatic_force.y);

				resulting_forces_for_subdivision_points.push(resulting_force);
			}

			resulting_forces_for_subdivision_points.push({
				'x': 0,
				'y': 0
			});

			return resulting_forces_for_subdivision_points;////0 力 0？？？
		}

		/*** ********************** ***/

		/*** Edge Division Calculation Methods ***/
		function update_edge_divisions(P) {///计算控制点
			for (var e_idx = 0; e_idx < data_edges.length; e_idx++) {
				if (P === 1) {//1个控制点就是起点中点终点
					subdivision_points_for_edge[e_idx].push(data_nodes[data_edges[e_idx].source]); // source
					subdivision_points_for_edge[e_idx].push(edge_midpoint(data_edges[e_idx])); // mid point
					subdivision_points_for_edge[e_idx].push(data_nodes[data_edges[e_idx].target]); // target
				} else {
					var divided_edge_length = compute_divided_edge_length(e_idx);//折线距离
					var segment_length = divided_edge_length / (P + 1);
					var current_segment_length = segment_length;
					var new_subdivision_points = [];
					new_subdivision_points.push(data_nodes[data_edges[e_idx].source]); //source

					for (var i = 1; i < subdivision_points_for_edge[e_idx].length; i++) {
						var old_segment_length = euclidean_distance(subdivision_points_for_edge[e_idx][i], subdivision_points_for_edge[e_idx][i - 1]);

						while (old_segment_length > current_segment_length) {
							var percent_position = current_segment_length / old_segment_length;
							var new_subdivision_point_x = subdivision_points_for_edge[e_idx][i - 1].x;
							var new_subdivision_point_y = subdivision_points_for_edge[e_idx][i - 1].y;

							new_subdivision_point_x += percent_position * (subdivision_points_for_edge[e_idx][i].x - subdivision_points_for_edge[e_idx][i - 1].x);
							new_subdivision_point_y += percent_position * (subdivision_points_for_edge[e_idx][i].y - subdivision_points_for_edge[e_idx][i - 1].y);
							new_subdivision_points.push({
								'x': new_subdivision_point_x,
								'y': new_subdivision_point_y
							});

							old_segment_length -= current_segment_length;
							current_segment_length = segment_length;
						}
						current_segment_length -= old_segment_length;
					}
					new_subdivision_points.push(data_nodes[data_edges[e_idx].target]); //target
					subdivision_points_for_edge[e_idx] = new_subdivision_points;
				}
			}
		}

		/*** ********************** ***/

		/*** Edge compatibility measures ***/
		function angle_compatibility(P, Q) {
			return Math.abs(vector_dot_product(edge_as_vector(P), edge_as_vector(Q)) / (edge_length(P) * edge_length(Q)));
		}

		function scale_compatibility(P, Q) {
			var lavg = (edge_length(P) + edge_length(Q)) / 2.0;
			return 2.0 / (lavg / Math.min(edge_length(P), edge_length(Q)) + Math.max(edge_length(P), edge_length(Q)) / lavg);
		}

		function position_compatibility(P, Q) {
			var lavg = (edge_length(P) + edge_length(Q)) / 2.0;
			var midP = {
				'x': (data_nodes[P.source].x + data_nodes[P.target].x) / 2.0,
				'y': (data_nodes[P.source].y + data_nodes[P.target].y) / 2.0
			};
			var midQ = {
				'x': (data_nodes[Q.source].x + data_nodes[Q.target].x) / 2.0,
				'y': (data_nodes[Q.source].y + data_nodes[Q.target].y) / 2.0
			};

			return lavg / (lavg + euclidean_distance(midP, midQ));
		}

		function edge_visibility(P, Q) {
			var I0 = project_point_on_line(data_nodes[Q.source], {
				'source': data_nodes[P.source],
				'target': data_nodes[P.target]
			});
			var I1 = project_point_on_line(data_nodes[Q.target], {
				'source': data_nodes[P.source],
				'target': data_nodes[P.target]
			}); //send actual edge points positions
			var midI = {
				'x': (I0.x + I1.x) / 2.0,
				'y': (I0.y + I1.y) / 2.0
			};
			var midP = {
				'x': (data_nodes[P.source].x + data_nodes[P.target].x) / 2.0,
				'y': (data_nodes[P.source].y + data_nodes[P.target].y) / 2.0
			};

			return Math.max(0, 1 - 2 * euclidean_distance(midP, midI) / euclidean_distance(I0, I1));
		}

		function visibility_compatibility(P, Q) {
			return Math.min(edge_visibility(P, Q), edge_visibility(Q, P));
		}

		function compatibility_score(P, Q) {//计算ce
			return (angle_compatibility(P, Q) * scale_compatibility(P, Q) * position_compatibility(P, Q) * visibility_compatibility(P, Q));
		}

		function are_compatible(P, Q) {//判断是否合适
			return (compatibility_score(P, Q) >= compatibility_threshold);
		}

		function compute_compatibility_lists() {//构造每条边的合适的边列表
			for (var e = 0; e < data_edges.length - 1; e++) {
				for (var oe = e + 1; oe < data_edges.length; oe++) { // don't want any duplicates
					if (are_compatible(data_edges[e], data_edges[oe])) {
						compatibility_list_for_edge[e].push(oe);
						compatibility_list_for_edge[oe].push(e);
					}
				}
			}
		}

		/*** ************************ ***/

		/*** Main Bundling Loop Methods ***/
		var forcebundle = function () {//模拟过程
			var S = S_initial;
			var I = I_initial;
			var P = P_initial;

			initialize_edge_subdivisions();
			initialize_compatibility_lists();
			update_edge_divisions(P);
			compute_compatibility_lists();

			for (var cycle = 0; cycle < C; cycle++) {
				for (var iteration = 0; iteration < I; iteration++) {
					var forces = [];
					for (var edge = 0; edge < data_edges.length; edge++) {
						forces[edge] = apply_resulting_forces_on_subdivision_points(edge, P, S,l);
					}
					for (var e = 0; e < data_edges.length; e++) {
						for (var i = 0; i < P + 1; i++) {
							subdivision_points_for_edge[e][i].x += forces[e][i].x;
							subdivision_points_for_edge[e][i].y += forces[e][i].y;
						}
					}
				}
				// prepare for next cycle
				S = S / 2;
				P = P * P_rate;
				I = I_rate * I;

				update_edge_divisions(P);
				//console.log('C' + cycle);
				//console.log('P' + P);
				//console.log('S' + S);
			}
			return subdivision_points_for_edge;
		};
		/*** ************************ ***/


		/*** Getters/Setters Methods ***/
		forcebundle.nodes = function (nl) {
			if (arguments.length === 0) {
				return data_nodes;
			} else {
				data_nodes = nl;
			}

			return forcebundle;
		};

		forcebundle.edges = function (ll) {
			if (arguments.length === 0) {
				return data_edges;
			} else {
				data_edges = filter_self_loops(ll); //remove edges to from to the same point
			}

			return forcebundle;
		};

		forcebundle.bundling_stiffness = function (k) {
			if (arguments.length === 0) {
				return K;
			} else {
				K = k;
			}

			return forcebundle;
		};

		forcebundle.step_size = function (step) {
			if (arguments.length === 0) {
				return S_initial;
			} else {
				S_initial = step;
			}

			return forcebundle;
		};

		forcebundle.cycles = function (c) {
			if (arguments.length === 0) {
				return C;
			} else {
				C = c;
			}

			return forcebundle;
		};

		forcebundle.iterations = function (i) {
			if (arguments.length === 0) {
				return I_initial;
			} else {
				I_initial = i;
			}

			return forcebundle;
		};

		forcebundle.iterations_rate = function (i) {
			if (arguments.length === 0) {
				return I_rate;
			} else {
				I_rate = i;
			}

			return forcebundle;
		};

		forcebundle.subdivision_points_seed = function (p) {
			if (arguments.length == 0) {
				return P;
			} else {
				P = p;
			}

			return forcebundle;
		};

		forcebundle.subdivision_rate = function (r) {
			if (arguments.length === 0) {
				return P_rate;
			} else {
				P_rate = r;
			}

			return forcebundle;
		};

		forcebundle.compatibility_threshold = function (t) {
			if (arguments.length === 0) {
				return compatibility_threshold;
			} else {
				compatibility_threshold = t;
			}

			return forcebundle;
		};

		/*** ************************ ***/

		return forcebundle;
	}
})();
