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
    <!-- JavaScripts -->
    <script src="/js/modernizr.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="/css/dialog/animate.min.css">
    <link rel="stylesheet" href="/css/dialog/jquery.gDialog.css">
    <script src="/js/dialog/jquery.js"></script>
    <script src="/js/dialog/jquery.gDialog.js"></script>


    <#--<style type="text/css">-->
        <#--.breadcrumb-search {-->
            <#--background: url("/img/i.jpg") no-repeat fixed center center / cover;-->
            <#--/*background-color: #FFF;*/-->
            <#--padding: 70px 0;-->
            <#--position: relative;-->
        <#--}-->
    <#--</style>-->
</head>

<body>
<div class="page">
    <div id="spinner">
        <div class="spinner-img"> <img alt="Opportunities Preloader" src="../img/images/loader.gif" />
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
    <div class="clearfix"></div>


    <section class="breadcrumb-search parallex" style="padding: 40px 0;">

    </section>
    <section class="login-page light-blue">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="login-container">
                        <div class="loginbox" id="large-header">
                            <div class="loginbox-title">sign in</div>
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

                            <form class="layui-form" action="/login/verify" name="f" method="post" id="login_form">
                                <div class="form-group">
                                    <label>Email: <span class="required">*</span></label>
                                    <#--<input placeholder="" class="form-control" type="email" name="email">-->
                                    <input name="email" class="form-control" required lay-verify="usererror" type="text" placeholder="please input email" style="text-transform: none;">
                                </div>
                                <div class="form-group">
                                    <label>Password: <span class="required">*</span></label>

                                    <#--<input placeholder="" class="form-control" type="password">-->

                                    <input name="password" class="form-control" value="" type="password" placeholder="please input password" style="text-transform: none;">
                                </div>
                                <div class="loginbox-forgot">
                                    <a href="">Forgot Password?</a>
                                </div>
                                <div class="loginbox-submit">
                                    <input type="button" class="btn btn-default btn-block" value="Login" onclick="submitForm()">
                                </div>
                            </form>


                            <div class="loginbox-signup">
                                <a href="/register/index">Sign Up With Email</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <#--在footer.ftl里面进行修改-->
    <#include "footer.ftl">
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

    <!-- JQUERY REVEAL -->
    <script type="text/javascript" src="/js/footer-reveal.min.js"></script>

    <!-- Owl Carousel -->
    <script type="text/javascript" src="/js/owl-carousel.js"></script>

    <!-- CORE JS -->
    <script type="text/javascript" src="/js/custom.js"></script>
</div>
</body>
<#--<script src="/js/demo-1.js"></script>-->
<script type="text/javascript">
    function submitForm(){
        document.getElementById("login_form").submit();
    }
    <#if loginerror??>
    $.gDialog.alert("${loginerror}", {
        title: "Login Error",
        animateIn: "bounceIn",
        animateOut: "bounceOut"
    });
    <#else>
        //location.href = "/index";
    </#if>

</script>
</html>