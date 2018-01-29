<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html long="en" class="no-js">
<head>
    <meta http-equiv="Content-Type"content="text/html; charset=UTF-8">
    <title>register</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${path}/layui/css/layui.css" type="text/css" media="all">
    <link href="../css/dialog/normalize.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../css/dialog/animate.min.css">
    <link rel="stylesheet" href="../css/dialog/jquery.gDialog.css">
    <script src="../js/dialog/jquery.js"></script>
    <script src="../js/dialog/jquery.gDialog.js"></script>

</head>
<body >
<div class="topNav" style="z-index: 15; margin: 0px; position: fixed; top: 0px;width: 100%">
    <ul class="layui-nav">
        <a href="/index"><img src="../img/wos_index.png" alt="" style="height: 60px"/></a>
    </ul>
    <ul class="layui-nav layui-layout-right">
    <#if Session.user?exists>
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="/hdfs/personalPhoto" class="layui-nav-img">
            ${Session['user'].name!""}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">base information</a></dd>
                <dd><a href="">modify information</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="/logout">logout</a></li>
    <#else>
        <li class="layui-nav-item"><a href="/login/index">login</a></li>
        <li class="layui-nav-item"><a href="/register/index">register</a></li>
    </#if>
    </ul>
</div>
<script type="text/javascript" src="../layui/layui.all.js" charset="utf-8"></script>
<#--<script src="../js/jquery.js"></script>-->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/stickUp.min.js"></script>

<script type="text/javascript">

    layui.use('element', function () {
        var element = layui.element;
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
    jQuery(function($) {
        $(document).ready( function() {
            $('.topNav').stickUp();
        });
    });
</script>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

<div class="layui-container">
    <form class="layui-form" action="/register/addUser" method="post" enctype="multipart/form-data">
        <div class="layui-form-item">
            <label class="layui-form-label"><font color="red">*</font> email</label>
            <div class="layui-input-block">
                <input type="text" name="email" required  lay-verify="email" placeholder="please input email" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font color="red">*</font> passward</label>
            <div class="layui-input-inline">
                <input type="password" name="password" id="password" required lay-verify="pass" placeholder="please input password" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font color="red">*</font> passward</label>
            <div class="layui-input-inline">
                <input type="password" name="rePassword" required lay-verify="repass" placeholder="please input password again" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><font color="red">*</font> name</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" placeholder="please input your name" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">sex</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="male" title="male" checked>
                <input type="radio" name="sex" value="female" title="female">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">position</label>
            <div class="layui-input-inline">
                <select name="position">
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
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">org</label>
            <div class="layui-input-block">
                <input type="text" name="org" placeholder="please input your organization" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">nation</label>
            <div class="layui-input-inline">
                <select name="nation" lay-search="">
                    <option value="">choose or search</option>
                    <#list countryNames as countryName>
                        <option value="${countryName}">${countryName}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">born date</label>
                <div class="layui-input-inline">
                    <input type="text" name="bornDate" id="bornDate" placeholder="choose your born date" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">supervisor</label>
            <div class="layui-input-block">
                <input type="text" name="supervisorName" placeholder="please input your supervisor name" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">grad date</label>
                <div class="layui-input-inline">
                    <input type="text" name="gradDate" id="graduateDate" placeholder="choose your graduate date" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">grad college</label>
            <div class="layui-input-block">
                <input type="text" name="gradCollege" placeholder="please input your graduate college" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">degree</label>
            <div class="layui-input-inline">
                <select name="degree">
                    <option value="">choose degree</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Master">Master</option>
                    <option value="Bachelor">Bachelor</option>
                    <option value="Other">Other</option>
                </select>
            </div>
        </div>
        <#--<div class="layui-form-item">-->
            <#--<label class="layui-form-label">personal photo</label>-->
            <#--<div id="test10" >-->
                <#--<i class="layui-icon"></i>-->
                <#--<p id="demo1">click or drag</p>-->
            <#--</div>-->
        <#--</div>-->
        <div class="layui-form-item">
            <div >

                <button type="button" class="layui-btn" id="test1">personal photo</button>
                &nbsp;&nbsp;
                <img class="layui-upload-img" id="demo1" width="80" height="80">
                <p id="demoText"></p>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">research field</label>
            <div class="layui-input-block">
                <textarea name="researchField" placeholder="please input your research field" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="submit">submit</button>
                <#--<button>立即提交</button>-->
                <button type="reset" class="layui-btn layui-btn-primary">reset</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>

<script>
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
</script>
<script src="../js/jquery.min.js"></script>
<script src="../js/stickUp.min.js"></script>

<script type="text/javascript">
    //initiating jQuery
    jQuery(function($) {
        $(document).ready( function() {
            //enabling stickUp on the '.navbar-wrapper' class
            $('.qqq').stickUp();
        });
    });
</script>

</body>
</html>