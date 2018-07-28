<#assign path="${request.getContextPath()}">
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
            color: #333;
            padding:none;
            height: 30px;
            border-color: #e6e6e6;
            /*margin:auto auto;*/
        }
        .layui-form-item .layui-input-inline {

            width: 143px;
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

    <section class="breadcrumb-search parallex" style="padding-bottom: 0;" >
        <div class="container-fluid">
            <div class="row" style="margin-top: 40px;">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">

                    <div class="col-md-2 col-sm-0  col-xs-0 nopadding" ></div>
                    <div class="col-md-8 col-sm-12  col-xs-12 nopadding" style="margin-top:-100px;">
                        <div class="search-form-contaner" style="text-align: center;margin-top: 2rem;width: auto;">
                            <#--<form class="layui-form" action="" method="post" enctype="multipart/form-data">-->


                                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px;background-color: #ffffff;opacity: 1">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-10 col-sm-10 col-xs-12">
                                                <form class="layui-form" id="searchForm" style="margin-right: 10px">

                                                    <div class="layui-form-item">
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                                        <div class="layui-form-item">
                                                            <label class="layui-form-label">scholar</label>
                                                            <div class="layui-input-block">
                                                                <input type="text" name="scholarName" id="scholarName" lay-verify="title" autocomplete="off" placeholder="scholar name" class="layui-input">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                                        <div class="layui-form-item">
                                                            <label class="layui-form-label">affiliation</label>
                                                            <div class="layui-input-block">
                                                                <input type="text" name="affName" lay-verify="title" autocomplete="off" placeholder="affiliation name" class="layui-input">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                                        <div class="layui-form-item">
                                                            <label class="layui-form-label" style="width: 110px;text-align: left">p-index</label>
                                                            <div class="layui-input-inline">
                                                                <input type="text" name="minQindex" placeholder="start" autocomplete="off" class="layui-input">
                                                            </div>
                                                            <div class="layui-form-mid">-</div>
                                                            <div class="layui-input-inline" >
                                                                <input type="text" name="maxQindex" placeholder="end" autocomplete="off" class="layui-input">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                                        <div class="layui-form-item">
                                                            <label class="layui-form-label" style="width: 110px;text-align: left">h-index</label>
                                                            <div class="layui-input-inline" >
                                                                <input type="text" name="minHindex" placeholder="start" autocomplete="off" class="layui-input">
                                                            </div>
                                                            <div class="layui-form-mid">-</div>
                                                            <div class="layui-input-inline">
                                                                <input type="text" name="maxHindex" placeholder="end" autocomplete="off" class="layui-input">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="col-md-2 col-sm-12 col-xs-2">
                                                <#--<div class="col-md-12 col-sm-12 col-xs-2">-->
                                                    <#--<div class="layui-form-item">-->
                                                        <div class="layui-input-block" style="margin-top: 2rem;margin-left: -3rem;">
                                                            <button style="width: 6rem;height: 6rem;" class="layui-btn" lay-submit="" lay-filter="demo1" id="searchButton">search</button>
                                                        </div>
                                                    <#--</div>-->
                                                <#--</div>-->
                                            </div>
                                        </div>
                                    </fieldset>



                                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;border-width: 1px;background-color: #ffffff;opacity:1;">
                                        <form id="sort_form" class="layui-form" action="" style="margin-right: 10px">
                                            <div class="col-md-3 col-sm-3 col-xs-0"></div>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <div class="layui-form-item">
                                                </div>
                                                <input type="hidden" id="scholarIds" name="scholarIds" value=""/>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">sort</label>
                                                    <div class="layui-input-inline" style="width: 240px">
                                                        <input type="radio" name="sortItem" value="q_index" title="p-index" checked="">
                                                        <input type="radio" name="sortItem" value="h_index" title="h-index">
                                                    </div>
                                                    <label class="layui-form-label"><a style="cursor: pointer" class="sort_type" value="up"><span class="glyphicon glyphicon-arrow-up"></span></a>&nbsp;&nbsp;&nbsp;
                                                        <a style="cursor: pointer" class="sort_type" value="down"><span class="glyphicon glyphicon-arrow-down"></span></a></label>
                                                </div>
                                            </div>
                                        </form>
                                    </fieldset>


                            <#--</form>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="categories-list-page light-grey" style="">
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
<script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>
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
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>
<#--<div id="result" style="position:absolute;top: 60%;left: 20%;opacity: 0.6">-->

    <#--kgjgjhgjghjghj-->
<#--</div>-->
<script type="text/javascript">


    $.ajax({
        type:"POST",
        url:'/searchMore/init',
        success:function (data) {
//            console.log(data);
            $("#result").html(data);

        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
//            alert(XMLHttpRequest.status);
//            alert(XMLHttpRequest.readyState);
//            alert(textStatus);
        }
    });
    var indexScholarName = "${indexScholarName}";
    $("#scholarName").val(indexScholarName);

    //scholarName=&affName=&minQindex=&maxQindex=&minHindex=&maxHindex=
    $("#searchButton").on("click", function () {
        //console.log($("#searchForm").serialize());
        $.ajax({
            type:"POST",
            url:'/searchMore/content',
            data:$("#searchForm").serialize(),
            success:function (data) {
                $("#result").html(data);

            },
            error:function (jqXHR,textStatus,errorThrown) {
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
            }
        });

    });


    $(".sort_type").on("click", function (event) {
        event.preventDefault();

        $.ajax({
            type:"POST",
            url:"/searchMore/sort/" + $("input:radio:checked").val() + "/" + $(this).attr("value"),
            contentType:"application/json",
            data:JSON.stringify(scholars),
            success:function (data) {

                $("#result").html(data);
            },
            error:function (jqXHR,textStatus,errorThrown) {
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
            }
        });
    });


</script>


</html>







