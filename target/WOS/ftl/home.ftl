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
    <title>WOS</title>
    <link rel="icon" href="img/images/favicon.ico" type="image/x-icon">

    <!-- BOOTSTRAPE STYLESHEET CSS FILES -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- JQUERY SELECT -->
    <link href="css/select2.min.css" rel="stylesheet" />

    <!-- JQUERY MENU -->
    <link rel="stylesheet" href="css/mega_menu.min.css">

    <!-- ANIMATION -->
    <link rel="stylesheet" href="css/animate.min.css">

    <!-- OWl  CAROUSEL-->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.style.css">

    <!-- TEMPLATE CORE CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!--  REVOLUTION STYLE SETTING -->
    <link href="js/revolution/css/settings.css" rel="stylesheet" type="text/css" />

    <!-- FONT AWESOME -->
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/et-line-fonts.css" type="text/css">
    <link rel="stylesheet" href="css/slideshowstyle.css" type="text/css">

    <link rel="stylesheet" href="layui/css/layui.css" type="text/css" media="all">


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
            height: 60px;
        }

        .layui-form-select dl dd.layui-this {
            /*background-color: #5FB878;*/
            background-color: rgba(77,196,25);
            color: #fff
        }
        .post-img{
            width: auto;
            margin-bottom: 30px;
            overflow: hidden;
            padding-left: 8rem;
            padding-top: 2rem;
        }
        .post-img img{
            width: 13rem;
            height: 13rem;
            /*width: 100%;*/
            /*height: auto;*/
            -moz-transition: all 2s;
            -o-transition: all 2s;
            -webkit-transition: all 2s;
            transition: all 2s;
        }

    </style>
</head>

<body>



<div class="page">
    <div id="spinner">
        <div class="spinner-img"> <img alt="Opportunities Preloader" src="/img/images/loader.gif" />
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
    <section class="slidershow-bg parallex">

        <div class="container">
            <div class="row">
                <ul class="cb-slideshow">
                    <li><span>Image 01</span></li>
                    <li><span>Image 02</span></li>
                    <li><span>Image 03</span></li>
                    <li><span>Image 04</span></li>
                </ul>
                <div class="col-md-10 col-sm-12 col-md-offset-1 col-xs-12 nopadding">
                    <div class="search-form-contaner">
                        <h1 class="search-main-title" style="text-transform：lowercase;">Web of Scholars</h1>
                        <form class="layui-form" action="/searchMore/index" method="post" enctype="multipart/form-data">

                            <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12 nopadding">
                                <div class="form-group">
                                    <input type="text" id="search" name="scholarName" class="form-control"  placeholder="Please  enter  a  scholar's  name">
                                </div>
                            </div>


                            <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                                <div class="form-group form-action">
                                    <button type="button" id="subBtn" class="btn btn-default btn-search-submit">Search
                                        <i
                                            class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="search">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="input-group">

                        <input type="hidden" name="search_param" value="all" id="search_param">
                        <input type="text" class="form-control search-field" name="x" placeholder="Search term...">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><span class="fa fa-search"></span></button>
                            </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="category-section-3 light-blue" id="cas">


        <div class="container">



            <div class="row">

                <div class="col-md-12 col-sm-12 col-xs-12">

                    <div class="Heading-title black">
                        <h1>Relations</h1>
                        <p>Based on a large number of academic papers, we conclude the following three relationships.</p>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <a href="/relationGraph/0CAEADF8/MVC">
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="category-section-3-box" >
                            <div class="category-section-3-box-inner">
                                <i class="fa fa-users"></i>
                                <h4> Cooperation </h4>
                                <span>( 1980 )</span> </div>

                        </div>
                    </div>
                    </a>
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="category-section-3-box">
                            <div class="category-section-3-box-inner"> <i class="fa fa-graduation-cap"></i>
                                <h4> advisor-advise</h4>
                                <span>( 980 )</span> </div>
                            <!--  <div class="category-section-3-box-over-text animated fadeIn">
                                 <h4>FINANCIAL MODELERS</h4>
                                 <h4>BOOKKEEPERS</h4>
                                 <h4>TAX ACCOUNTANTS</h4>
                                 <p><a href=""> See All </a></p>
                             </div> -->
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="category-section-3-box">
                            <div class="category-section-3-box-inner"> <i class="fa fa-pencil"></i>
                                <h4> Citation </h4>
                                <span>( 660 )</span> </div>
                            <!--  <div class="category-section-3-box-over-text animated fadeIn">
                                 <h4>SEO SPECIALISTS</h4>
                                 <h4>MARKETING EXPERTS</h4>
                                 <h4>EMAIL AUTOMATORS</h4>
                                 <p><a href=""> See All </a></p>
                             </div> -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section class="blog-posts-section">




        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="Heading-title black">
                            <h1>The top 3 scholars</h1>
                            <p>Here are the top three scholars based on a large number of papers.</p>
                        </div>
                    </div>
                </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="blog-post">
                            <div class="post-img"> <a href="#"> <img src="/img/images/users/scholarImg.png" alt="" class="img-responsive"> </a> </div>

                            <div class="post-info" id="c1"><a >Please wait...</a>
                            <h3 class="post-title" id="n1"> <a href="#">  </a>
                            </h3>
                            </div>
                            <p class="post-excerpt" id="a1"> </p>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="blog-post">
                            <div class="post-img"> <a href="#"> <img src="/img/images/users/scholarImg.png" alt="" class="img-responsive"> </a> </div>

                            <div class="post-info" id="c2"><a >Please wait...</a>
                            <h3 class="post-title" id="n2"> <a href="#">
                            </a> </h3>
                            </div>
                            <p class="post-excerpt" id="a2"></p>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="blog-post">
                            <div class="post-img"> <a href="#"> <img src="/img/images/users/scholarImg.png" alt="" class="img-responsive"> </a> </div>

                            <div class="post-info" id="c3"><a >Please wait...</a>
                            <h3 class="post-title" id="n3"> <a href="#">
                            </a> </h3>
                            </div>
                            <p class="post-excerpt" id="a3">  </p>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="load-more-btn">
                            <a href="/rank/index"><button class="btn-default" style="text-transform:none;">All Rankings<i class="fa fa-angle-right"></i> </button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="fixed-footer-1">
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-xs-12">
                        <div class="footer_block">
                            <a href="index.html" class="f_logo"><img src="img/images/temp/wos.png" class="img-responsive" alt="logo"></a>
                            <p>A website that draws scholars' connections through a large number of papers and information analysis.
                            </p>

                        </div>
                    </div>

                    <div class="col-sm-6 col-md-6 col-xs-12">
                        <div class="footer_block">
                            <h4>Contact Information</h4>
                            <ul class="personal-info">
                                <li><i class="fa fa-map-marker"></i> Development Zone, Dalian 116620, China </li>
                                <li><i class="fa fa-envelope"></i> http://thealphalab.org/</li>
                                <li><i class="fa fa-phone"></i> 12345678910 </li>
                                <!-- <li><i class="fa fa-clock-o"></i> Mon - Sun: 8:00 - 16:00</li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    <#--在footer.ftl里面进行修改-->
    <#include "footer.ftl">
    </div>

    <a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>

    <!-- JAVASCRIPT JS  -->
    <script type="text/javascript" src="/js/jquery-2.2.3.min.js"></script>

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

    <!-- Owl Carousel -->
    <script type="text/javascript" src="/js/owl-carousel.js"></script>

    <!-- TEXT ROTATOR -->
    <script type="text/javascript" src="/js/typed.js"></script>

    <!-- JQUERY REVEAL -->
    <script type="text/javascript" src="/js/footer-reveal.min.js"></script>

    <!-- jQuery REVOLUTION Slider  -->
    <script src="js/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="js/revolution/js/jquery.themepunch.revolution.min.js"></script>

    <!-- CORE JS -->
    <script type="text/javascript" src="js/custom.js"></script>

    <script type="text/javascript" src="layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">

        $("#subBtn").click(function () {

            var scholarName =  $("#search").val();
            scholarName = "scholarName="+scholarName+"&affName=&minQindex=&maxQindex=&minHindex=&maxHindex=";
            location.href = '/searchMore/index?'+scholarName;

        });

        $.ajax({
            type:"POST",
            url:'/scholar/indexinfo?authorId=0CAEADF8',
            success:function (data) {

                $("#c1").children("a").html('Q-index: '+data.qindex+' | H-index: '+data.hindex);

                $("#n1").children("a").html(data.name);
                $("#a1").html('Affiliation: '+data.aff+'</br>'+'StudyField: '+data.fieldName);
            }
        });
        $.ajax({
            type:"POST",
            url:'/scholar/indexinfo?authorId=7B374211',
            success:function (data) {
                $("#c2").children("a").html('Q-index: '+data.qindex+' | H-index: '+data.hindex);
                $("#n2").children("a").html(data.name);
                $("#a2").html('Affiliation: '+data.aff+'</br>'+'StudyField: '+data.fieldName);
            }
        });
        $.ajax({
            type:"POST",
            url:'/scholar/indexinfo?authorId=6AECDE8A',
            success:function (data) {
                $("#c3").children("a").html('Q-index: '+data.qindex+' | H-index: '+data.hindex);
                $("#n3").children("a").html(data.name);

                $("#a3").html('Affiliation: '+data.aff+'</br>'+'StudyField: '+data.fieldName);
            }
        });
//        $.ajax({
//            type:"POST",
//            url:'/scholar/baseInfo?authorId=7CEFBC45',
//            success:function (data) {
//                $("#c4").html(data);
//            }
//        });
    </script>
</div>
<#--<div id="cas"></div>-->
<script  src="/js/dist/canvas-nest.js"  count="100"></script>


</body>

</html>

