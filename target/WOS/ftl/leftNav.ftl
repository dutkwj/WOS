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
    <title>leftNav</title>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">

    <link rel="stylesheet" href="/css/nav/leftnav.css" media="screen" type="text/css"/>

    <link rel="icon" href="/img/images/favicon.ico" type="image/x-icon">

    <!-- BOOTSTRAPE STYLESHEET CSS FILES -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

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

    <!-- Google Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,900,300" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">

    <!-- JavaScripts -->
    <#--<script src="/js/modernizr.js"></script>-->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>




    <![endif]-->

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
                <ul class="menu-logo">
                    <li>
                        <a href="/index"> <img src="/img/images/temp/wos_top.png" width="220px" height="40px" alt="logo" class="img-responsive"> </a>
                    </li>
                </ul>
                <ul class="menu-links pull-right">
                <#if Session.user?exists>
                    <li><a href="">${Session['user'].name!""}</a></li>
                    <li class="no-bg"><a href="/logout" class="p-job">logout</a></li>

                <#else>
                    <li><a href="/login/index">Login</a></li>
                    <li class="no-bg"><a href="/register/index" class="p-job">register</a></li>
                </#if>



                </ul>
            </section>
        </nav>
    </header>

    <div class="clearfix"></div>
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
    <section class="breadcrumb-search parallex" style="padding: 40px 0;">

    </section>
    <section class="categories-list-page light-grey" style="padding-top:50px;height:1000px;">
        <#--<div class="container">-->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="col-md-1 col-sm-12 col-xs-12"></div>

                    <div id="bigContainer" class="col-md-8 col-sm-12 col-xs-12">

                    </div>

                    <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 30px">
                        <aside>

                            <div class="widget">
                                <div class="widget-heading"><span class="title" style="border-bottom-color: #f39800;">Relationship</span></div>
                                <ul id="accordion" class="accordion">
                                    <li id="cooperate">
                                        <div class="links">Cooperation<i class="fa fa-chevron-down"></i></div>
                                        <ul class="submenu" id="cooperate-ul">
                                            <#--<li id="direct-cooperate-li"><a id="directCooperate">direct cooperate</a></li>-->
                                            <li id="mvc-li"><a id="mvc">MVC</a></li>
                                            <li id="collaborator-location-li"><a id="collLocation">Collaborator
                                                location</a></li>
                                            <#--<li id="collaborator-number-li"><a id="collNumber">collaborator number</a></li>-->
                                        </ul>
                                    </li>
                                    <#--<li id="team">-->
                                        <#--<div class="link">team<i class="fa fa-chevron-down"></i></div>-->
                                        <#--<ul class="submenu" id="team-ul">-->
                                            <#--<li id="strong-team-li"><a id="strongTeam">strong team</a></li>-->
                                            <#--<li id="middle-team-li"><a id="middleTeam">middle team</a></li>-->
                                            <#--<li id="weak-team-li"><a id="weakTeam">weak team</a></li>-->
                                        <#--</ul>-->
                                    <#--</li>-->
                                    <li>
                                        <div class="links" id="tea_main">Advisor-advise<i class="fa
                                        fa-chevron-down"></i></div>
                                        <ul class="submenu">
                                            <li><a id="tree">Genealogy relationship</a></li>
                                            <li><a id="graph">Cooperation relationship</a></li>
                                            <li><a id="reference">Reference relationship</a></li>
                                            <li><a id="evalue">Evaluation and comparison</a></li>
                                            <li><a id="student_number_year">Student_number_year</a></li>
                                        </ul>
                                    </li>
                                    <li id="cite">
                                        <div class="links">Citation<i class="fa fa-chevron-down"></i></div>
                                        <ul class="submenu" id="cite-ul">
                                            <li id="direct-cite-li"><a id="directCite">Direct citation</a></li>
                                            <#--<li id="direct-cited-li"><a id="directCited">direct cited</a></li>-->
                                            <li id="common-cite-li"><a id="commonCite">Common citation</a></li>
                                            <#--<li id="common-cited-li"><a id="commonCited">Common cited</a></li>-->
                                        </ul>
                                    </li>
                                </ul>
                            </div >



                            <div class="widget">
                                <div class="widget-heading"><span class="title">Recent search</span></div>
                                <ul class="categories-module" id="RcentVisited">
                                    <#--<li>  <a>scholar1  </a> </li>-->
                                    <#--<li>  <a>scholar1  </a> </li>-->
                                    <#--<li>  <a>scholar1  </a> </li>-->
                                    <#--<li>  <a>scholar1  </a> </li>-->
                                    <#--<li>  <a>scholar1  </a> </li>-->

                                </ul>
                            </div>




                        </aside>
                    </div>
                </div>
            <#--</div>-->
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

    <#--<script type="text/javascript" src="/js/time_map/echarts.min.js"></script>-->
    <!-- JAVASCRIPT JS  -->
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>

    <#--<script src="/js/time_map/d3.v4.min.js"></script>-->
    <#--<script src="/js/time_map/d3.v3.min.js"></script>-->

    <!-- BOOTSTRAP CORE JS -->
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <!-- JQUERY SELECT -->
    <script type="text/javascript" src="/js/select2.min.js"></script>
    <!-- MEGA MENU -->
    <script type="text/javascript" src="/js/mega_menu.min.js"></script>

    <!-- JQUERY EASING -->
    <#--<script type="text/javascript" src="/js/easing.js"></script>-->

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

    <script src='/js/nav/leftnav.js'></script>
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
        <#--if ("${type}" == "directCooperate") {-->
            <#--$("#cooperate").addClass("open");-->
            <#--$("#cooperate-ul").css("display", "block");-->
            <#--$("#direct-cooperate-li").addClass("current");-->
            <#--$.ajax({-->
                <#--type:"POST",-->
                <#--url:'/cooperate/${scholarId!""}/directCooperate',-->
                <#--success:function (data) {-->
                    <#--$("#bigContainer").html(data);-->
                <#--}-->
            <#--});-->

        if ("${type}" == "MVC") {
            $("#cooperate").addClass("open");
            $("#cooperate-ul").css("display", "block");
            $("#mvc-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/cooperate/${scholarId!""}/MVC',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "collaLocation") {
            $("#cooperate").addClass("open");
            $("#cooperate-ul").css("display", "block");
            $("#collaborator-location-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/cooperate/${scholarId!""}/worldMap',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "collaNumber") {
            $("#cooperate").addClass("open");
            $("#cooperate-ul").css("display", "block");
            $("#collaborator-number-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/cooperate/${scholarId!""}/yearCounts',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "weakTeam") {
            $("#team").addClass("open");
            $("#team-ul").css("display", "block");
            $("#weak-team-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/team/${scholarId!""}/weakTeam',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "middleTeam") {
            $("#team").addClass("open");
            $("#team-ul").css("display", "block");
            $("#middle-team-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/team/${scholarId!""}/middleTeam',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "strongTeam") {
            $("#team").addClass("open");
            $("#team-ul").css("display", "block");
            $("#strong-team-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/team/${scholarId!""}/strongTeam',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "directCite") {
            $("#cite").addClass("open");
            $("#cite-ul").css("display", "block");
            $("#direct-cite-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/ref/${scholarId!""}',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "directCited") {
            $("#cite").addClass("open");
            $("#cite-ul").css("display", "block");
            $("#direct-cited-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/refed/${scholarId!""}',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "commonCite") {
            $("#cite").addClass("open");
            $("#cite-ul").css("display", "block");
            $("#common-cite-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/coRef/${scholarId!""}',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "commonCited") {
            $("#cite").addClass("open");
            $("#cite-ul").css("display", "block");
            $("#common-cited-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/coRefed/${scholarId!""}',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        } else if ("${type}" == "name") {
            $("#cooperate").addClass("open");
            $("#cooperate-ul").css("display", "block");
            $("#direct-cooperate-li").addClass("current");
            $.ajax({
                type:"POST",
                url:'/cooperate/${scholarName!""}/name',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        }


        $("#directCooperate").click(function () {
            $.ajax({
                type:"POST",
                url:'/cooperate/${scholarId!""}/directCooperate',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#mvc").click(function () {
            $.ajax({
                type:"POST",
                url:'/cooperate/${scholarId!""}/MVC',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#collLocation").click(function () {
            $.ajax({
                type:"POST",
                url:'/cooperate/${scholarId}/worldMap',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#collNumber").click(function () {
            $.ajax({
                type:"POST",
                url:'/cooperate/${scholarId}/yearCounts',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#weakTeam").click(function () {
            $.ajax({
                type:"POST",
                url:'/team/${scholarId!""}/weakTeam',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#middleTeam").click(function () {
            $.ajax({
                type:"POST",
                url:'/team/${scholarId!""}/middleTeam',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#strongTeam").click(function () {
            $.ajax({
                type:"POST",
                url:'/team/${scholarId!""}/strongTeam',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#directCite").click(function () {
            //$("#bigContainer").html(" ");
            $.ajax({
                type:"POST",
                url:'/ref/${scholarId!""}',
                success:function (data) {
//                    alert("ddd");
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#directCited").click(function () {
            $.ajax({
                type:"POST",
                url:'/refed/${scholarId!""}',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#commonCite").click(function () {

            $.ajax({
                type:"POST",
                url:'/coRef/${scholarId!""}',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });

        $("#commonCited").click(function () {
            $.ajax({
                type:"POST",
                url:'/coRefed/${scholarId!""}',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });
        $("#reference").click(function () {
            $.ajax({
                type:"POST",
                url:'/Advisor-advisee/${scholarId!""}/reference',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });
        $("#tree").click(function () {
            $.ajax({
                type:"POST",
                url:'/Advisor-advisee/${scholarId!""}/tree',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });
        $("#graph").click(function () {
            $.ajax({
                type:"POST",
                url:'/Advisor-advisee/${scholarId!""}/graph',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });
        $("#evalue").click(function () {
            $.ajax({
                type:"POST",
                url:'/Advisor-advisee/${scholarId!""}/evalue',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });
        $("#student_number_year").click(function () {
            $.ajax({
                type:"POST",
                url:'/Advisor-advisee/${scholarId!""}/student_number_year',
                success:function (data) {
                    $("#bigContainer").html(data);
                }
            });
        });
    </script>


    <!--jquery.cookie.js-->
    <script type="text/javascript" src="/js/jquery.cookie.js"></script>
    <script type="text/javascript">

        $(function(){

            if($.cookie('scholars')==null){
                var scholars = [];
                $.cookie('scholars', JSON.stringify(scholars), { path: '/', expires: 7 });
            }
            dispHtml();

        });

    </script>

<script type="text/javascript">


    function dispHtml() {
        var scholars = JSON.parse($.cookie('scholars'));
        $('#RcentVisited').html("");
        scholars.forEach(function (item,index) {
            //console.log("index :" + index + JSON.stringify(item));
            var temp = "li:eq("+index+")";
            var url = '/relationGraph/'+item.id+'/MVC';

//            <a href="dsfasd"></a>
           var list = '<li><a href="'+ url+ ' " >' + item.name + '</a> </li>';
           //console.log(list);
            $('#RcentVisited').append(list);
        });
    }
    function addRecentVisit(scholar) {

        var scholars = JSON.parse($.cookie('scholars'));
        if(isInIt(scholar)){
            console.log("is in it");
            dispHtml();
            return;
        }else if(scholars.length<5){
            scholars.push(scholar);
        }else if(scholars.length==5){
            scholars.splice(0,1);
            scholars.push(scholar);

        }

        dispHtml();

        $.cookie('scholars', JSON.stringify(scholars), { path: '/', expires: 7 });

    }
    function isInIt(scholar){
        var scholars = JSON.parse($.cookie('scholars'));
        for(var i=0;i<scholars.length;i++){
            if(scholars[i].id == scholar.id){
                return true;
            }
        }
        return false;
    }

</script>

</html>