
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


                            <form class="layui-form" action="/register/addUser" method="post" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label>Email: <span class="required">*</span></label>

                                    <input type="text" name="email" required  lay-verify="email" placeholder="please input email" autocomplete="off" class="layui-input" class="form-control" style="text-transform: none;">
                                </div>
                                <div class="form-group">
                                    <label>Password: <span class="required">*</span></label>

                                    <input type="password" name="password" id="password" required lay-verify="pass" placeholder="please input password" autocomplete="off" class="form-control" style="text-transform: none;">
                                </div>
                                <div class="form-group">
                                    <label>Confirm Password: <span class="required">*</span></label>

                                    <input type="password" name="rePassword" required lay-verify="repass" placeholder="please input password again" autocomplete="off" class="form-control" style="text-transform: none;">
                                </div>
                                <div class="form-group">
                                    <label>name: <span class="required">*</span></label>

                                    <input type="text" name="name" required lay-verify="required" placeholder="please input your name" autocomplete="off" class="form-control"  style="text-transform: none;">
                                </div>

                                <div class="form-group" style="margin: 2rem 0;">
                                    <label>sex: <span class="required">*</span></label>

                                    <div class="layui-input-block" style="margin-left: none;margin-top: -3rem;">
                                        <input type="radio" name="sex" value="male" title="male" checked style="text-transform: none;">
                                        <input type="radio" name="sex" value="female" title="female" style="text-transform: none;">
                                    </div>
                                    <#--<select class="" style="width: 20px;">-->
                                        <#--<option value="0">male</option>-->
                                        <#--<option value="1">female</option>-->
                                    <#--</select>-->
                                </div>

                                <div class="form-group">
                                    <label>position: <span class="required">*</span></label>
                                    <select class="form-control" style="width: 20px;" name="position">

                                        <option value="Professor">Professor</option>
                                        <option value="Associate Professor">Associate Professor</option>
                                        <option value="Assitant Professor">Assitant Professor</option>
                                        <option value="Researcher">Researcher</option>
                                        <option value="PostDoc">PostDoc</option>
                                        <option value="Phd Student">Phd Student</option>
                                        <option value="Master Student">Master Student</option>
                                        <option value="Bachelor Student">Bachelor Student</option>
                                        <option value="Other">Other</option>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>org: <span class="required">*</span></label>
                                    <input placeholder="please input your organization" name="org" autocomplete="off" class="form-control" type="text" style="text-transform: none;">
                                </div>
                                <div class="form-group">
                                    <label>nation: <span class="required">*</span></label>
                                    <#--<select class="">-->
                                        <#--<!-- <option>&nbsp;</option> &ndash;&gt;-->
                                        <#--<option value="0">Cooperation</option>-->
                                        <#--<option value="1">Advisor-advise</option>-->
                                        <#--<option value="2">Citation</option>-->

                                    <#--</select>-->


                                    <select name="nation" lay-search="" class="form-control">
                                        <option value="">choose or search</option>
                                    <#list countryNames as countryName>
                                        <option value="${countryName}">${countryName}</option>
                                    </#list>
                                    </select>

                                </div>

                                <div class="form-group">
                                    <label>born date: <span class="required">*</span></label>
                                    <input type="text" name="bornDate" id="bornDate" style="text-transform: none;" placeholder="choose your born date" autocomplete="off" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>supervisor: <span class="required">*</span></label>
                                    <input placeholder="please input your supervisor name" class="form-control" type="text" style="text-transform: none;">
                                </div>
                                <div class="form-group">
                                    <label>grad date: <span class="required">*</span></label>
                                    <input type="text" name="graduateDate" id="graduateDate" style="height: 48px; border: 1px solid #ccc;" placeholder="choose your grad date" autocomplete="off" class="form-control" style="text-transform: none;">
                                </div>

                                <div class="form-group">
                                    <label>grad college: <span class="required">*</span></label>
                                    <input placeholder="please input your graduate college" name="gradCollege" class="form-control" type="text" style="text-transform: none;">
                                </div>
                                <div class="form-group">
                                    <label>degree: <span class="required" name="degree">*</span></label>
                                    <select class="form-control" style="height: 48px; border: 1px solid #ccc;" style="text-transform: none;">

                                        <option value="0">Doctor</option>
                                        <option value="1">master</option>
                                        <option value="2">Bechelor</option>
                                        <option value="3">Other</option>

                                    </select>
                                </div>

                                <div class="layui-form-item">
                                    <div >

                                        <button type="button" class="layui-btn" id="test1">personal photo</button>
                                        &nbsp;&nbsp;
                                        <img class="layui-upload-img" id="demo1" width="80" height="80">
                                        <p id="demoText"></p>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="layui-form-item layui-form-text">
                                        <label>research field: <span class="required" name="degree">*</span></label>
                                        <#--<label class="layui-form-label">research field</label>-->
                                        <div class="layui-input-block" style="margin-left: 0;">
                                            <textarea name="researchField" placeholder="please input your research field" class="layui-textarea" style="width:35rem;"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="loginbox-forgot">
                                    <input type="checkbox"> I accept <a href="">Term and consitions?</a>
                                </div>

                                <div class="loginbox-submit">
                                    <input type="submit" class="btn btn-default btn-block" value="Register" lay-submit lay-filter="formDemo" id="submit" >
                                </div>
                            </form>
                            <div class="layui-layer-move"></div>

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
    <script type="text/javascript">
        layui.use(['form', 'layedit', 'laydate'], function(){
            var form = layui.form
                    ,layer = layui.layer
                    ,laydate = layui.laydate;

            //日期
            laydate.render({
                elem: '#bornDate',
                lang: 'en'
            });
            laydate.render({
                elem: '#graduateDate',
                lang: 'en'
            });

            //自定义验证规则
            form.verify({
                repass: function(value){
                    var password = document.getElementById('password').value;
                    if (!(password == value)) {
                        return "two input password must be consistent";
                    }
                }
                ,required:[/[\S]+/,"must input area can't be null"]
                ,pass: [/(.+){6,12}$/, 'password length must between 6 to 12']
                ,email:[/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,"email format is not right"]
            });


            //监听提交
            form.on('submit(demo1)', function(data){
                layer.alert(JSON.stringify(data.field), {
                    title: '最终的提交信息'
                });
                return false;
            });
        });


        layui.use('upload', function(){
            var $ = layui.jquery
                    ,upload = layui.upload;


            //普通图片上传
            var uploadInst = upload.render({
                elem: '#test1'
                ,url: '/register/addUser'
                ,auto: false //选择文件后不自动上传
                ,bindAction: '#submit' //指向一个按钮触发上传
                ,choose: function(obj){
                    obj.preview(function(index, file, result){
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    //如果上传失败
                    if(res.code > 0){
                        return layer.msg('上传失败');
                    }
                    //上传成功
                }
//            ,error: function(){
//                //演示失败状态，并实现重传
////                var demoText = $('#demoText');
////                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
////                demoText.find('.demo-reload').on('click', function(){
////                    uploadInst.upload();
////                });
//            }
            });
        });

        <#if registerError??>
        $.gDialog.alert("${registerError!"register error"}", {
            title: "Register Error",
            animateIn: "bounceIn",
            animateOut: "bounceOut"
        });
        </#if>

    </script>


</div>


</body>


</html>