
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ScriptsBundle">
    <title>rankIndex|wos</title>
    <link rel="icon" href="/img/images/favicon.ico" type="image/x-icon">

    <!-- BOOTSTRAPE STYLESHEET CSS FILES -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <!-- JQUERY SELECT -->
    <link href="/css/select2.min.css" rel="stylesheet" />

    <!-- JQUERY MENU -->
    <link rel="stylesheet" href="/css/mega_menu.min.css">

    <!-- ANIMATION -->
    <link rel="stylesheet" href="/css/animate.min.css">

    <!-- OWl  CAROUSEL-->
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/css/owl.style.css">

    <!-- TEMPLATE CORE CSS -->
    <link rel="stylesheet" href="/css/style.css">

    <!-- FONT AWESOME -->
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/et-line-fonts.css" type="text/css">

    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css" media="all">

    <!-- Google Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,900,300" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">

    <!-- JavaScripts -->
    <script src="/js/modernizr.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


    <![endif]-->
    <style type="text/css">
        .layui-select-title input{
            height: 40px;
        }
        .layui-form-select dl dd.layui-this {
            /*background-color: #5FB878;*/
            background-color: rgba(77,196,25);
            color: #fff
        }
        .img-circle {
            border-radius: 50%;
        }
        .profile-skills{
            margin-top: 20px;
            margin-left: 5px;
        }
        .form-group{
            height: 80px;
            padding-top: 30px;
        }
        .layui-form-label{
            color: white;
            padding:none;
            height: 30px;
            /*margin:auto auto;*/
        }
    </style>
</head>

<body>
<div class="page category-page">
    <div id="spinner">
        <div class="spinner-img">
            <img alt="Opportunities Preloader" src="/img/images/loader.gif" />
            <h2>Please Wait.....</h2>
        </div>
    </div>

    <header id="header2" class="navbar transparent-header fa-change-white">
        <nav id="menu-1" class="mega-menu" data-color="">
            <section class="menu-list-items">
                <#include "nav.ftl">
            </section>
        </nav>
    </header>
    <#--<div class="search">-->
        <#--<div class="container-fluid">-->
            <#--<div class="row">-->
                <#--<div class="col-md-12 col-sm-12 col-xs-12 nopadding">-->
                    <#--<div class="input-group">-->
                        <#--<div class="input-group-btn search-panel">-->
                            <#--<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <span id="search_concept">Filter By</span> <span class="caret"></span> </button>-->
                            <#--<ul class="dropdown-menu" role="menu">-->
                                <#--<li><a href="#">Cooperation</a></li>-->
                                <#--<li><a href="#">Advisor-advise</a></li>-->
                                <#--<li><a href="#">Citation</a></li>-->
                            <#--</ul>-->
                        <#--</div>-->
                        <#--<input type="hidden" name="search_param" value="all" id="search_param">-->
                        <#--<input type="text" class="form-control search-field" name="x" placeholder="Search term...">-->
                        <#--<span class="input-group-btn">-->
                        <#--<button class="btn btn-default" type="button"><span class="fa fa-search"></span></button>-->
                            <#--</span>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</div>-->
        <#--</div>-->
    <#--</div>-->
    <section class="breadcrumb-search parallex" >
        <div class="container-fluid">
            <div class="row" style="margin-top: 40px;">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="col-md-8 col-sm-12 col-md-offset-2 col-xs-12 nopadding">
                        <div class="search-form-contaner" style="text-align: center">
                            <form class="layui-form" action="/register/addUser" method="post" enctype="multipart/form-data">

                                <div class="col-md-1 col-sm-1 col-xs-12 nopadding" id="part_1" style="display: none;"></div>
                                <div class="col-md-2 col-sm-2 col-xs-12 nopadding" id="part_2" style="display: none;"></div>
                                <div class="col-md-3 col-sm-3 col-xs-12 nopadding" id="part_3" style="display: block;"></div>
                                <div class="col-md-4 col-sm-4 col-xs-12 nopadding" id="part_4" style="display: none;"></div>
                                <div class="col-md-2 col-sm-2 col-xs-12 nopadding" >
                                    <div class="col-md-3 col-sm-3 col-xs-12"></div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label class="layui-form-label">type</label>
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-12"></div>

                                    <div class="form-group">

                                        <select id="sort_item" name="sortItem" lay-filter="sort_item1" style="height: 80px;">
                                            <#--<option label="Select Option" placeholder="fdsfad"></option>-->
                                            <option value="cooperator number">collaborator number</option>
                                            <option value="team members">team number</option>
                                            <option value="students number">students number</option>
                                            <option value="reference number">direct cite number</option>
                                            <option value="referenced number">direct cited number</option>
                                            <option value="common reference number">common cite number</option>
                                            <option value="common referenced number">common cited number</option>
                                            <option value="potential index">potential index</option>
                                            <option value="potential index by growthrate">potential index by growth</option>
                                            <option value="potential index by academicage">potential index by academicage</option>
                                        </select>

                                    </div>
                                </div>

                                <div class="col-md-2 col-sm-2 col-xs-12 nopadding">

                                    <div class="col-md-3 col-sm-3 col-xs-12"></div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label class="layui-form-label">rank</label>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12"></div>

                                    <div class="form-group">

                                        <select id="sort_range" name="sortItem" style="height: 80px;">
                                            <option value="top10">top10</option>
                                            <option value="top50">top50</option>
                                            <option value="top100">top100</option>
                                        </select>

                                    </div>
                                </div>

                                <div class="col-md-2 col-sm-2 col-xs-12 nopadding" id="period" style="display: none;">


                                    <div class="col-md-3 col-sm-3 col-xs-12"></div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label class="layui-form-label">potentialperoid</label>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12"></div>

                                    <div class="form-group">
                                        <div  id="period_select">
                                            <select id="potential_peroid" name="sortItem" style="height: 80px;">
                                                <option value="3 years">3 years</option>
                                                <option value="5 years">5 years</option>
                                                <option value="10 years">10 years</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-md-2 col-sm-2 col-xs-12 nopadding" id="academicage_div" style="display: none;">
                                    <div class="col-md-3 col-sm-3 col-xs-12"></div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label class="layui-form-label">academicage</label>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12"></div>

                                    <div class="form-group">

                                        <select id="academicage" name="sortItem" style="height: 80px;">
                                            <option value="1-5">1-5</option>
                                            <option value="6-15">6-15</option>
                                            <option value="16-25">16-25</option>
                                            <option value="26-40">26-40</option>
                                            <option value="41-60">41-60</option>
                                            <option value="61-80">61-80</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-2 col-sm-2 col-xs-12 nopadding" >
                                    <label class="layui-form-label" style="padding-top: 40px;">
                                        <a style="cursor: pointer" class="sort_type" value="up"><span class="glyphicon glyphicon-arrow-up" style="color: white"></span></a>&nbsp;&nbsp;&nbsp;
                                        <a style="cursor: pointer" class="sort_type" value="down" ><span class="glyphicon glyphicon-arrow-down" style="color: white"></span></a>
                                    </label>
                                </div>
                                <#--<div class="col-md-2 col-sm-2 col-xs-12 nopadding">-->
                                    <#--<div class="form-group form-action">-->
                                        <#--<button type="button" class="btn btn-default btn-search-submit">Search <i class="fa fa-angle-right"></i> </button>-->
                                    <#--</div>-->
                                <#--</div>-->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="categories-list-page light-grey">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">

                    <div class="col-md-9 col-sm-12 col-xs-12" id="result">

                        <#--<div class="profile-content">-->
                            <#--<div class="card">-->
                                <#--<div class="firstinfo">-->
                                    <#--<img src="/img/images/users/scholarImg.png"  alt="" class="img-circle img-responsive" />-->
                                    <#--<div class="profileinfo">-->
                                        <#--<h1> <a href=""> cishi </a></h1>-->
                                        <#--<h4>P-index:80.93|Hindex:9| Cooperator number:3373</h4>-->
                                        <#--<p class="bio">-->
                                            <#--Afliation: Information School, The-->
                                            <#--rsity of Sheffeld, Sheffield, UK-->
                                            <#--1</p>-->
                                        <#--<div class="profile-skills">-->
                                            <#--<span> Data access </span> <span> Web accessiblity </span> <span> Health informatics </span> <span>  Atificial itelligence </span>-->
                                        <#--</div>-->
                                        <#--<div class="hire-btn">-->
                                            <#--<a href="graph.html" class="btn-default" > <i class="fa fa-location-arrow"></i> Relation</a>-->
                                        <#--</div>-->
                                    <#--</div>-->
                                <#--</div>-->
                            <#--</div>-->
                        <#--</div>-->


                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <aside>
                            <div class="widget">
                                <div class="widget-heading"><span class="title">Recent search</span></div>
                                <ul class="categories-module">
                                    <li> <a href=""> scholar1 <span>(1021)</span> </a> </li>
                                    <li> <a href=""> scholar2 <span>(54)</span> </a> </li>
                                    <li> <a href=""> scholar3<span>(13)</span> </a> </li>
                                    <li> <a href=""> scholar5<span>(23)</span> </a> </li>
                                    <li> <a href=""> scholar6 <span>(42)</span> </a> </li>
                                </ul>
                            </div>
                            <!-- <div class="widget">
                                <div class="widget-heading"><span class="title">Latest Articles</span></div>
                                <ul class="related-post">
                                    <li>
                                        <a href="#">Assistant Manager Procurement </a>
                                        <span><i class="fa fa-map-marker"></i>Managgo, WC </span>
                                        <span><i class="fa fa-calendar"></i>March 22, 2015 </span>
                                    </li>
                                    <li>
                                        <a href="#">Marketing Professionals Required</a>
                                        <span><i class="fa fa-map-marker"></i>Homelando, New Vage </span>
                                        <span><i class="fa fa-calendar"></i>Sep 01, 2015</span>
                                    </li>
                                    <li>
                                        <a href="#">Mobile App Programmers </a>
                                        <span><i class="fa fa-map-marker"></i>Homelando, New Vage </span>
                                        <span><i class="fa fa-calendar"></i> - March 09, 2016 </span>
                                    </li>
                                    <li>
                                        <a href="#">General Compliance Officer</a>
                                        <span><i class="fa fa-map-marker"></i>Arlington, VA </span>
                                        <span><i class="fa fa-calendar"></i>Feb 09, 2016</span>
                                    </li>
                                    <li>
                                        <a href="#">Call Centre Manager</a>
                                        <span><i class="fa fa-map-marker"></i>Managgo, WC  </span>
                                        <span><i class="fa fa-calendar"></i> March 09, 2016</span>
                                    </li>
                                    <li>
                                        <a href="#">Assistant Manager Audit</a>
                                        <span><i class="fa fa-map-marker"></i>Heling, WC </span>
                                        <span><i class="fa fa-calendar"></i>Aug 01, 2015 - </span>
                                    </li>
                                    <li>
                                        <a href="#">Telesales Agent (UK Dialing)</a>
                                        <span><i class="fa fa-map-marker"></i>Somro, New </span>
                                        <span><i class="fa fa-calendar"></i>Sep 01, 2015</span>
                                    </li>
                                    <li>
                                        <a href="#">Assistant Brand Manager</a>
                                        <span><i class="fa fa-map-marker"></i>Heritage, VA </span>
                                        <span><i class="fa fa-calendar"></i>May 09, 2016</span>
                                    </li>
                                </ul>
                            </div> -->

                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="fixed-footer-1">

        <section class="footer-bottom-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="footer-bottom">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <p>Copyright ©2018 - <a href="http://thealphalab.org/">The Alpha Lab </a></p>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>

</div>
</body>



<script src="/js/jquery-3.2.1.min.js"></script>
<!-- JAVASCRIPT JS  -->
<#--<script type="text/javascript" src="/js/jquery-2.2.3.min.js"></script>-->


<!-- BOOTSTRAP CORE JS -->
<script type="text/javascript" src="/js/bootstrap.min.js"></script>

<!-- JQUERY SELECT -->
<script type="text/javascript" src="/js/select2.min.js"></script>
<!-- MEGA MENU -->
<script type="text/javascript" src="/js/mega_menu.min.js"></script>

<!-- JQUERY EASING -->
<script type="text/javascript" src="/js/easing.js"></script>

<!-- JQUERY COUNTERUP -->
<script type="text/javascript" src="/js/counterup.js"></script>

<!-- JQUERY WAYPOINT -->
<script type="text/javascript" src="/js/waypoints.min.js"></script>

<!-- JQUERY REVEAL -->
<script type="text/javascript" src="/js/footer-reveal.min.js"></script>

<!-- Owl Carousel -->
<script type="text/javascript" src="/js/owl-carousel.js"></script>

<!-- FOR THIS PAGE ONLY -->

<script src="/js/imagesloaded.js"></script>
<script src="/js/isotope.min.js"></script>

<!-- CORE JS -->
<script type="text/javascript" src="/js/custom.js"></script>





<script type="text/javascript">
    (function($) {
        "use strict";
        $('#posts-masonry').imagesLoaded(function() {
            $('#posts-masonry').isotope({
                layoutMode: 'masonry',
                transitionDuration: '0.3s'
            });
        });
    })(jQuery);
</script>



<script type="text/javascript">
    $.ajax({
        type:"POST",
        url:'/rank/top100?type=cooperator number&&range=top10&&upOrDown=down&&period=null&&academicage=null',
        success:function (data) {
//                console.log(data);
            $("#result").html(data);
        }
    });

    $(".sort_type").on("click", function (event) {
        event.preventDefault();
        if($("#sort_item").val() != 'potential index' && $("#sort_item").val() != 'potential index by academicage' && $("#sort_item").val() != 'potential index by growthrate'){
            $.ajax({
                type:"POST",
                url:'/rank/top100?type=' + $("#sort_item").val() + '&&range=' + $('#sort_range').val() + '&&upOrDown=' + $(this).attr('value') + '&&period=null&&academicage=null',
                success:function (data) {
                    $("#result").html(data);
//                    sortItemReg();
                }
            });
        }
        else {
            if($("#sort_item").val() == 'potential index by academicage'){
                $.ajax({
                    type:"POST",
                    url:'/rank/top100?type=' + $("#sort_item").val() + '&&range=' + $('#sort_range').val() + '&&upOrDown=' + $(this).attr('value') + '&&period=' + $("#potential_peroid").val() + '&&academicage=' + $("#academicage").val(),
                    success:function (data) {
                        $("#result").html(data);
//                        sortItemReg();
                    }
                });
            }
            else {
                $.ajax({
                    type:"POST",
                    url:'/rank/top100?type=' + $("#sort_item").val() + '&&range=' + $('#sort_range').val() + '&&upOrDown=' + $(this).attr('value') + '&&period=' + $("#potential_peroid").val() + '&&academicage=null',
                    success:function (data) {
                        $("#result").html(data);
//                        sortItemReg();
                    }
                });
            }
        }

    });
</script>


<script type="text/javascript" src="/layui/layui.all.js" charset="utf-8"></script>

<script type="text/javascript">
    $(function () {

        layui.use('form', function(){
            var form = layui.form;
            form.on('select(sort_item1)', function (data) {
                var categoryName = data.value;
//                var categoryName = data.elem[data.elem.selectedIndex].text;
//                console.log(category);
                console.log(categoryName);
//                form.render('select');

                if ((categoryName == 'potential index')||(categoryName == 'potential index by growthrate')){
                    console.log("1");
//                    $('#period_label').removeClass('layui-hide');
//                    $('#period_select').removeClass('layui-hide');
                    $('#part_3').css('display','block');
                    $('#part_2').css('display','none');
                    $('#period').css('display','block');

//                    $('#academicage_label').addClass('layui-hide');
//                    $('#academicage_select').addClass('layui-hide');
                    $('#academicage_div').css('display','none');
                    form.render();
                } else if(categoryName == 'potential index by academicage'){
                    console.log("2");
                    $('#part_3').css('display','none');
                    $('#part_2').css('display','block');
                    $('#academicage_div').css('display','block');
                    $('#academicage_div').css('display','block');
                    form.render();
                } else {
                    console.log("3");
                    $('#part_3').css('display','block');
                    $('#part_2').css('display','none');
                    $('#period').css('display','none');
                    $('#period').css('display','none');
                    $('#academicage_div').css('display','none');
                    $('#academicage_div').css('display','none');
                    form.render();
                }
            });
        });
    })




</script>

</html>







