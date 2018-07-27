
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ScriptsBundle">
    <title>register</title>
    <link rel="icon" href="../img/images/favicon.ico" type="image/x-icon">

    <!-- BOOTSTRAPE STYLESHEET CSS FILES -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- JQUERY MENU -->
    <link rel="stylesheet" href="/css/mega_menu.min.css">

    <!-- ANIMATION -->
    <link rel="stylesheet" href="/css/animate.min.css">

    <!-- OWl  CAROUSEL-->
    <link rel="stylesheet" href="/css/owl.carousel.css">

    <link rel="stylesheet" href="/css/owl.style.css">

    <!-- TEMPLATE CORE CSS -->
    <link rel="stylesheet" href="/css/style.css">

    <!-- FOR THIS PAGE ONLY -->
    <link href="/css/select2.min.css" rel="stylesheet" />

    <!-- FONT AWESOME -->
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/et-line-fonts.css" type="text/css">

    <!-- Google Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,900,300" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">


    <script type="text/javascript" src="/js/jquery-2.2.3.min.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css" media="all">
    <link href="/css/dialog/normalize.css" rel="stylesheet" type="text/css">
    <!-- JavaScripts -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <link href="/css/dialog/normalize.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/css/dialog/animate.min.css">
    <link rel="stylesheet" href="/css/dialog/jquery.gDialog.css">

    <script src="/js/dialog/jquery.gDialog.js"></script>


    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="/css/dialog/animate.min.css">
    <link rel="stylesheet" href="/css/dialog/jquery.gDialog.css">
    <script src="/js/dialog/jquery.js"></script>
    <script src="/js/dialog/jquery.gDialog.js"></script>
    <style type="text/css">

        .layui-form-select dl dd.layui-this {
            /*background-color: #5FB878;*/
            background-color: rgba(77,196,25);
            color: #fff;
        }

        .layui-laydate .layui-this{
            background-color: rgb(77,196,25);
            color: #fff;
        }


    </style>
</head>

<body style="height: 1000px">
<#--for layui alert's position ,chage the body'height to 1000 px 20180723 liyunhao-->



<div class="page category-page">
    <div id="spinner">
        <div class="spinner-img"> <img alt="Opportunities Preloader" src="../img/images/loader.gif" />
            <h2>Please Wait.....</h2>
        </div>
    </div>
    <header id="header2" class="navbar transparent-header fa-change-white">
        <nav id="menu-1" class="mega-menu" data-color="">
            <section class="menu-list-items">
                <ul class="menu-logo">
                    <li>
                        <a href="/index"> <img src="../img/images/temp/wos_top.png" width="220px" height="40px" alt="logo" class="img-responsive"> </a>
                    </li>
                </ul>
                <ul class="menu-links pull-right">
                <#if Session.user?exists>
                    <li><a href="">${Session['user'].name!""}</a></li>
                <#--<li class="no-bg"><a href="" class="p-job">register</a></li>-->

                <#else>
                    <li><a href="/login/index">Login</a></li>
                    <li class="no-bg"><a href="/register/index" class="p-job">register</a></li>
                </#if>
                </ul>
            </section>
        </nav>
    </header>
    <div class="clearfix"></div>


    <section class="breadcrumb-search parallex" style="padding: 40px 0;">

    </section>

    <section class="login-page light-blue">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="login-container">
                        <div class="loginbox">
                            <div class="loginbox-title">Sign Up</div>
                        <#--<ul class="social-network social-circle onwhite">-->
                        <#--<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>-->
                        <#--<li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>-->
                        <#--<li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>-->
                        <#--<li><a href="#" class="icoLinkedin" title="Linkedin +"><i class="fa fa-linkedin"></i></a></li>-->
                        <#--</ul>-->
                            <div class="loginbox-or">
                                <div class="or-line"></div>
                            <#--<div class="or">OR</div>-->
                            </div>

                            <div class="loginbox-signup"> Already have account <a href="/login/index">Sign in</a> </div>
                        </div>
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

    <!-- JAVASCRIPT JS  -->

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

    <!-- CORE JS -->
    <script type="text/javascript" src="/js/custom.js"></script>

    <script type="text/javascript" src="/layui/layui.all.js" charset="utf-8"></script>



</div>


</body>


</html>