<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--suppress ALL -->
<html long="en" class="no-js" xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
    <title>show</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css" media="all">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>

    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <link rel="stylesheet" href="/css/prettyPhoto/css/prettyPhoto.css">

    <link rel="stylesheet" href="/Font_Awesome/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/social-icons.css">

    <Link rel="stylesheet" href="/css/showInfo.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">




    <!-- JQUERY MENU -->
    <link rel="stylesheet" href="/css/mega_menu.min.css">


    <link rel="stylesheet" href="/css/owl.style.css">

    <link rel="stylesheet" href="/css/style.css">


    <link rel="stylesheet" href="/css/et-line-fonts.css" type="text/css">

    <!-- Google Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,900,300" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">


    <script type="text/javascript" src="/js/jquery-2.2.3.min.js"></script>

    <link href="/css/dialog/normalize.css" rel="stylesheet" type="text/css">

</head>
<body >

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

</div>

<div class="product-showcase" style="margin-top: 0;height: 1080px;">
    <div class="product-showcase-pattern">
        <div class="container">
            <div class="row">
                <div class="span12 product-background">
                    <div class="row">
                        <div class="span5 product-image">
                            <img src="/hdfs/personalPhoto" style="width: 200px;height: 200px" alt="">
                        </div>
                        <div class="span7 product-title">
                            <h1 onmouseover="showEditIcon1(this)" onmouseout="hideEditIcon1(this)">
                                <div id="edit-input" class="hide-item">
                                    <input id="user-edit"  palceholder="name">
                                <#--<button class="btn btn-default btn-sm">Cancel</button>-->
                                    <button class="btn btn-primary btn-sm" style="margin-top: 10px" onclick="modifyUserName(this)">Modify</button>
                                </div>
                            <#if userInfo.name?exists>
                                <span class="show-item" id="name">${userInfo.name}</span>
                            <#else>
                                <span class="show-item" id="name">the information is not completed</span>
                            </#if>
                                <span class="edit-info1 glyphicon glyphicon-pencil" onclick="edit(this)"></span>
                            </h1>
                            <div class="product-description">
                                <p>
                                    <label>emial:&nbsp;&nbsp;</label>
                                <#if userInfo.email?exists>
                                    <span id="email"> ${userInfo.email}</span>
                                <#else>
                                    <span id="email">the information is not completed</span>
                                </#if>
                                </p>

                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)">
                                    <div class="layui-form-item hide-item1  ">
                                        <label class="selectlabel">sex:&nbsp;&nbsp;</label>
                                        <div class="sexradio">
                                            <input name="sex" value="male" title="male" checked="" type="radio">&nbsp;&nbsp;  male &nbsp;&nbsp;
                                            <input name="sex" value="female" title="female" type="radio">&nbsp;&nbsp;  female &nbsp;&nbsp;
                                            <button class="btn btn-primary btn-sm" style="margin-bottom: 5px" onclick="modifyUserSex(this)">Modify</button>
                                        </div>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label>sex:&nbsp;&nbsp;</label>
                                    <#if userInfo.sex?exists>
                                        <span id="sex">${userInfo.sex}</span>
                                    <#else>
                                        <span id="sex">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="sexedit(this)"></span>
                                    </div>
                                </div>
                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)" style="margin-top: 10px">
                                    <div class="layui-form-item hide-item1">
                                        <label class="selectlabel">position:&nbsp;&nbsp;</label>
                                        <div class="layui-input-inline">
                                            <select id="position" style="background: #0b0b0ba;color: #0b0b0b">
                                                <option value="">choose position</option>
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
                                        <button class="btn btn-primary btn-sm" style="margin-bottom: 1px" onclick="modifyUserPosition(this)">Modify</button>
                                    </div>
                                    <div class="show-item" id="div2">
                                        <label>position:&nbsp;&nbsp;</label>
                                    <#if userInfo.position?exists>
                                        <span id="position">${userInfo.position}</span>
                                    <#else>
                                        <span id="position">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="sexedit(this)"></span>
                                    </div>
                                </div>

                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)" style="margin-top: 10px">
                                    <div id="edit-input" class="hide-item">
                                        <label>org:&nbsp;&nbsp;</label>
                                        <input id="user-edit"  palceholder="name">
                                    <#--<button class="btn btn-default btn-sm">Cancel</button>-->
                                        <button class="btn btn-primary btn-sm" onclick="modifyUserOther(this)">Modify</button>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label>org:&nbsp&nbsp</label>
                                    <#if userInfo.org?exists>
                                        <span id="org">${userInfo.org}</span>
                                    <#else>
                                        <span id="org">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="edit1(this)"></span>
                                    </div>
                                </div>
                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)" style="margin-top: 10px">
                                    <div class="layui-form-item hide-item1">
                                        <label class="selectlabel">nation:&nbsp;&nbsp;</label>
                                        <div class="layui-input-inline">
                                            <select id="nation" lay-search="" style="background: #0b0b0ba;color: #0b0b0b">
                                                <option value="">choose or search</option>
                                            <#list countryNames as countryName>
                                                <option value="${countryName}">${countryName}</option>
                                            </#list>
                                            </select>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary btn-sm" style="margin-bottom: 1px" onclick="modifyUserNation(this)">Modify</button>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label>nation:&nbsp;&nbsp;</label>
                                    <#if userInfo.nation?exists>
                                        <span id="nation">${userInfo.nation}</span>
                                    <#else>
                                        <span id="nation">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="sexedit(this)"></span>
                                    </div>
                                </div>
                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)" style="margin-top: 10px">
                                    <div class="layui-inline hide-item1">
                                        <label class="selectlabel">born date:&nbsp;&nbsp;</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="bornDate" placeholder="choose your born date" autocomplete="off" style="color: #0b0b0b">
                                        </div>
                                        <button class="btn btn-primary btn-sm" style="margin-bottom: 1px" onclick="modifyDate(this)">Modify</button>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label> born date:&nbsp;&nbsp;</label>
                                    <#if userInfo.bornDate?exists>
                                        <span id="bornDate">${userInfo.bornDate}</span>
                                    <#else>
                                        <span id="bornDate">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="sexedit(this)"></span>
                                    </div>
                                </div>
                            <#--<form action="assets/subscribe.php" method="post" class="subscribe">-->
                            <#--<input type="text" name="email" class="email" placeholder="Enter your email">-->
                            <#--<button type="submit">Get it now!</button>-->
                            <#--</form>-->
                            </div>

                            <div class="product-description1">
                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)">
                                    <div id="edit-input" class="hide-item">
                                        <label>supervisor:&nbsp;&nbsp;</label>
                                        <input id="user-edit"  palceholder="supervisor">
                                    <#--<button class="btn btn-default btn-sm">Cancel</button>-->
                                        <button class="btn btn-primary btn-sm" onclick="modifyUserOther(this)">Modify</button>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label>supervisor:&nbsp;&nbsp;</label>
                                    <#if userInfo.supervisorName?exists>
                                        <span id="supervisorName">${userInfo.supervisorName}</span>
                                    <#else>
                                        <span id="supervisorName">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="edit1(this)"></span>
                                    </div>
                                </div>
                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)" style="margin-top: 10px">
                                    <div class="layui-inline hide-item1">
                                        <label class="selectlabel">born date:&nbsp;&nbsp;</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="gradDate" placeholder="choose your graduate date" autocomplete="off" style="color: #0b0b0b">
                                        </div>
                                        <button class="btn btn-primary btn-sm" style="margin-bottom: 1px" onclick="modifyDate(this)">Modify</button>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label>grad date:&nbsp;&nbsp;</label>
                                    <#if userInfo.gradDate?exists>
                                        <span id="gradDate">  ${userInfo.gradDate} </span>
                                    <#else>
                                        <span id="gradDate">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="sexedit(this)"></span>
                                    </div>
                                </div>
                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)" style="margin-top: 10px">
                                    <div id="edit-input" class="hide-item">
                                        <label>grad college:&nbsp;&nbsp;</label>
                                        <input id="user-edit"  palceholder="grad college">
                                    <#--<button class="btn btn-default btn-sm">Cancel</button>-->
                                        <button class="btn btn-primary btn-sm" onclick="modifyUserOther(this)">Modify</button>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label>grad college:&nbsp;&nbsp;</label>
                                    <#if userInfo.gradCollege?exists>
                                        <span id="gradCollege">${userInfo.gradCollege}</span>
                                    <#else>
                                        <span id="gradCollege">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="edit1(this)"></span>
                                    </div>
                                </div>
                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)" style="margin-top: 10px">
                                    <div class="layui-form-item hide-item1">
                                        <label class="selectlabel">degree&nbsp;&nbsp;</label>
                                        <div class="layui-input-inline">
                                            <select id="degree" style="color: #0b0b0b">
                                                <option value="">choose degree</option>
                                                <option value="Doctor">Doctor</option>
                                                <option value="Master">Master</option>
                                                <option value="Bachelor">Bachelor</option>
                                                <option value="Other">Other</option>
                                            </select>
                                        </div>
                                        <button class="btn btn-primary btn-sm" style="margin-bottom: 1px" onclick="modifyUserDegree(this)">Modify</button>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label>degree:&nbsp&nbsp</label>
                                    <#if userInfo.degree?exists>
                                        <span id="degree">${userInfo.degree}</span>
                                    <#else>
                                        <span id="degree">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="sexedit(this)"></span>
                                    </div>
                                </div>
                                <div onmouseover="showEditIcon(this)" onmouseout="hideEditIcon(this)" style="margin-top: 10px">
                                    <div id="edit-input" class="hide-item">
                                        <label>research field:&nbsp;&nbsp;</label>
                                        <input id="user-edit"  palceholder="research field">
                                    <#--<button class="btn btn-default btn-sm">Cancel</button>-->
                                        <button class="btn btn-primary btn-sm" onclick="modifyUserOther(this)">Modify</button>
                                    </div>
                                    <div id="div2" class="show-item">
                                        <label>research field:&nbsp;&nbsp;</label>
                                    <#if userInfo.researchField?exists>
                                        <span id="researchField">${userInfo.researchField}</span>
                                    <#else>
                                        <span id="researchField">the information is not completed</span>
                                    </#if>
                                        <span class="edit-info glyphicon glyphicon-pencil" onclick="edit1(this)"></span>
                                    </div>
                                </div>
                            <#--<form action="assets/subscribe.php" method="post" class="subscribe">-->
                            <#--<input type="text" name="email" class="email" placeholder="Enter your email">-->
                            <#--<button type="submit">Get it now!</button>-->
                            <#--</form>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../layui/layui.all.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>






<!-- Product Showcase -->




    <script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>

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
            elem: '#gradDate',
            lang: 'en'
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
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
    });

</script>

</script>
<#--<script src="../js/jquery.min.js"></script>-->
<#--<script src="../js/stickUp.min.js"></script>-->

<script type="text/javascript">
    //initiating jQuery
//    jQuery(function($) {
//        $(document).ready( function() {
//            //enabling stickUp on the '.navbar-wrapper' class
//            $('.qqq').stickUp();
//        });
//    });

    function y(ele){
        alart(iuhruihierrhgui);
    }



    function showEditIcon(ele){
//        console.log(123);
//        $(ele).find('p:nth-child(2)').find('span.edit-info').css("display", 'inline');
        $(ele).find('div#div2').find('span.edit-info').css("display",'inline');
    }

    function hideEditIcon(ele){
        $(ele).find('div#div2').find('span.edit-info').css("display", 'none');
    }

    function showEditIcon1(ele) {
        $(ele).find('span.edit-info1').css("visibility",'visible');
    }
    function hideEditIcon1(ele) {
        $(ele).find('span.edit-info1').css("visibility",'hidden');
    }
    function showEditIconselect(ele){

    }



    function edit(ele){
//        String els = ele;
//        $('#user-edit').val($('#'+ele).html());
        $('#user-edit').val($(ele).prev().html());
        $(ele).prev('.show-item').css("display",'none');
        $(ele).prev().prev('.hide-item').css("display",'inline');


//        layer.open({
//            type: 1,
//            area: ['500px', '300px'],
//            title: 'Edit',
//            shadeClose: true,
//            content: $('#edit-org')
//        });
    }
    function edit1(ele){
//        String els = ele;
//        $('#user-edit').val($('#'+ele).html());
        $(ele).parent().prev().find('input#user-edit').val($(ele).prev().html());
        $(ele).parent('.show-item').css("display",'none');
        $(ele).parent().prev('.hide-item').css("display",'inline');
    }

   function sexedit(ele){
        $(ele).parent().prev('.hide-item1').css("display",'inline');
        $(ele).parent('.show-item').css("display",'none');
   }


    function modifyUserName(ele){
        $(ele).parent('.hide-item').css("display",'none');
        var namee = {};
        var newName = $(ele).prev().val();
        var nameid = $(ele).parent().siblings().attr('id');
        namee[nameid]=newName;
        if(newName != "" && newName !=null){
            $.post('/showPersonalInfo/modifyInfo', namee, function(result){
                result = eval('('+result+')');
    //            if(result.success){
                    layer.msg(result.success);
    //            }else{
    //                layer.msg('Failure');
    //            }
            });
            $(ele).parent().parent().find('span.show-item').html(newName);
        }
        $(ele).parent().parent().find('span.show-item').css('display', 'inline-block');
    }

    function modifyUserOther(ele) {
        $(ele).parent('.hide-item').css("display", 'none');
        var newOther = $(ele).prev().val();
        var id = $(ele).parent().siblings().find('span:nth-child(2)').attr('id');
        var other = {};
        other[id] = newOther;
        if (newOther != "" && newOther != 'the information is not completed'){
            $.post('/showPersonalInfo/modifyInfo', other, function (result) {
                result = eval('(' + result + ')');
                layer.msg(result.success);
            });
            $(ele).parent().siblings().find('span:nth-child(2)').html(newOther);
        }
        $(ele).parent().siblings('.show-item').css("display",'inline-block');
    }

    function modifyUserSex(ele){
        $(ele).parent().parent('.hide-item1').css("display",'none');
        var sex=$("input[name='sex']:checked").val();
        if (sex != "" && sex != 'the information is not completed') {
            $.post('/showPersonalInfo/modifyInfo', {sex: sex}, function (result) {
                result = eval('(' + result + ')');
                layer.msg(result.success);
            });
            $(ele).parent().parent().siblings().find('span#sex').html(sex);
        }
        $(ele).parent().parent().siblings('.show-item').css("display",'inline-block');
    }

    function modifyUserPosition(ele){
        $(ele).parent('.hide-item1').css("display",'none');
        var position=$("#position option:selected").val();
        if (position != "" && position != 'the information is not completed') {
            $.post('/showPersonalInfo/modifyInfo', {position: position}, function (result) {
                result = eval('(' + result + ')');
                layer.msg(result.success);
            });
            $(ele).parent().siblings().find('span#position').html(position);
        }
        $(ele).parent().siblings('.show-item').css("display",'inline-block');
    }

    function modifyUserNation(ele){
        $(ele).parent('.hide-item1').css("display",'none');
        var nation = $("#nation option:selected").val();
        if (nation != "" && nation != 'the information is not completed') {
            $.post('/showPersonalInfo/modifyInfo', {nation: nation}, function (result) {
                result = eval('(' + result + ')');
                layer.msg(result.success);
            });
            $(ele).parent().siblings().find('span#nation').html(nation);
        }
        $(ele).parent().siblings('.show-item').css("display",'inline-block');
    }

    function modifyDate(ele){
        $(ele).parent('.hide-item1').css("display",'none');
        var dateid = $(ele).prev().find('input').attr('id');
        var date = $(ele).prev().find('input').val();
        var datee = {};
        datee[dateid] = date;
        if (date != "" && date != 'the information is not completed') {
            $.post('/showPersonalInfo/modifyInfo', datee, function (result) {
                result = eval('(' + result + ')');
                layer.msg(result.success);
            });
            $(ele).parent().siblings().find('span:nth-child(2)').html(date);
        }
        $(ele).parent().siblings('.show-item').css("display",'inline-block');
    }
    function modifyUserDegree(ele){
        $(ele).parent('.hide-item1').css("display",'none');
        var degree=$("#degree option:selected").val();
        if (degree != "" && degree != 'the information is not completed') {
            $.post('/showPersonalInfo/modifyInfo', {degree: degree}, function (result) {
                result = eval('(' + result + ')');
                layer.msg(result.success);
            });
            $(ele).parent().siblings().find('span#degree').html(degree);
        }
        $(ele).parent().siblings('.show-item').css("display",'inline-block');
    }


</script>


    <script src="/js/jquery.backstretch.min.js"></script>
    <script src="/js/jquery.tweet.js"></script>
    <script src="/js/jquery.prettyPhoto.js"></script>
    <script src="/js/showInfo-scripts.js"></script>
<!-- BOOTSTRAP CORE JS -->
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="/js/custom.js"></script>

</body>
</html>