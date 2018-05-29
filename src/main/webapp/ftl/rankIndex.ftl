<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/htmleaf-demo.css">
    <link rel="stylesheet" href="/css/csslider.default.css" />
    <link rel="stylesheet" href="/css/inner.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/topNavStyle.css">
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css" media="all">
    <link rel="stylesheet" href="/css/templatemo-style.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">

    <script src='/js/jquery-3.2.1.min.js'></script>
    <script src="/js/megamenu.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js" charset="utf-8"></script>


    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <style type="text/css">
        span.counter { display:block; margin:10px auto; font-size:64px; font-family:'Pacifico';color:#ffffcc}
    </style>
    <style type="text/css">
        html, body {
            height: 100%;
            width: 100%;
            margin: 0;
            overflow: hidden;
        }
        #site-landing {
            position:relative;
            /*height: 1800px;*/
            /*width: 120%;*/
            background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
        }
    </style>
</head>
<body>
<div id="site-landing">
</div>

<div>
    <a href="/index"><img style="position: absolute;width: 20%;left: 20px;top: 5px;" src="/img/wos_top.png"/></a>
</div>

<div class="menu-container" style="background:none;position: absolute;top:0;left:25%;">
    <div class="menu" style="background:none">
        <ul style="font-size: 19px">
            <li style="background:none"><a href="/index" style="color:#ffffcc">Home</a></li>
            <li style="background:none"><a href="" style="color:#ffffcc">Relationship</a>
                <ul>
                    <li><a href="#">Cooperate</a>
                        <ul>
                            <li><a href="#">Cooperate Graph</a></li>
                            <li><a href="#">Most Valuable Collaborators</a></li>
                            <li><a href="#">Collaborators Location</a></li>
                            <li><a href="#">Collaborators Number</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Team</a>
                        <ul>
                            <li><a href="#">Strong Team</a></li>
                            <li><a href="#">Middle Team</a></li>
                            <li><a href="#">Weak Team</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Advisor-advise</a>
                        <ul>
                            <li><a href="#">Undergraduate research</a></li>
                            <li><a href="#">Masters research</a></li>
                            <li><a href="#">Funding</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Cite</a>
                        <ul>
                            <li><a href="#">direct Cite</a></li>
                            <li><a href="#">direct Cited</a></li>
                            <li><a href="#">Common Cite</a></li>
                            <li><a href="#">Common Cited</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li style="background:none"><a href="/searchMore/index" style="color:#ffffcc">Search</a>
            </li>
            <li style="background:none"><a href="/rank/index" style="color:#ffffcc">Ranking</a>
            </li>
            <#--<li style="background:none"><a href="#" style="color:#ffffcc">API</a>-->
            <#--</li>-->
            <li style="background:none"><a href="/login/index" style="color:#ffffcc;margin-left: 200%">Login</a>
            </li>
            <li style="background:none">    <a href="/register/index" style="color:#ffffcc;margin-left: 150%">Register</a>
            </li>
        </ul>
    </div>
</div>

<div class="layui-container" style="position:absolute;top: 10%;left: 20%;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px;background-color: #ffffff;opacity:1;">
        <form id="sort_form" class="layui-form" action="" style="margin-right: 10px">
            <div class="layui-form-item">
            </div>
        <#list scholars as scholar>
        </#list>
            <input type="hidden" id="scholarIds" name="scholarIds" value=""/>
            <div class="layui-form-item">
                <label class="layui-form-label">rank</label>
                <div class="layui-input-inline" style="width:22%;">
                    <select id="sort_item" name="sortItem" lay-select lay-filter="sort_item1">
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
                <div class="layui-input-inline">
                    <select id="sort_range" name="sortItem">
                        <option value="top10">top10</option>
                        <option value="top50">top50</option>
                        <option value="top100">top100</option>
                    </select>
                </div>

                <label class="layui-form-label layui-hide" id="period_label" style="width:12%;">potential peroid</label>
                <div class="layui-input-inline layui-hide" id="period_select" style="width:10%;">
                    <select id="potential_peroid" name="sortItem">
                        <option value="3 years">3 years</option>
                        <option value="5 years">5 years</option>
                        <option value="10 years">10 years</option>
                    </select>
                </div>
                <label class="layui-form-label layui-hide" id="academicage_label" style="width:10%;">academicage</label>
                <div class="layui-input-inline layui-hide" id="academicage_select" style="width:10%;">
                    <select id="academicage" name="sortItem">
                        <option value="1-5">1-5</option>
                        <option value="6-15">6-15</option>
                        <option value="16-25">16-25</option>
                        <option value="26-40">26-40</option>
                        <option value="41-60">41-60</option>
                        <option value="61-80">61-80</option>
                    </select>
                </div>
                <label class="layui-form-label"><a style="cursor: pointer" class="sort_type" value="up"><span class="glyphicon glyphicon-arrow-up"></span></a>&nbsp;&nbsp;&nbsp;
                    <a style="cursor: pointer" class="sort_type" value="down"><span class="glyphicon glyphicon-arrow-down"></span></a></label>
            </div>
        </form>
    </fieldset>
</div>
<script type="text/javascript">
    $(function(){
        layui.use('form', function () {
            var form = layui.form;
            console.log('1111111');
            form.on("select(sort_item1)", function () {
                console.log('2222222');
                if (($('#sort_item').val() == 'potential index')||($('#sort_item').val() == 'potential index by growthrate')){
                    console.log($('#sort_item').val());
                    $('#period_label').removeClass('layui-hide');
                    $('#period_select').removeClass('layui-hide');
                    $('#academicage_label').addClass('layui-hide');
                    $('#academicage_select').addClass('layui-hide');
                    form.render();
                } else if($('#sort_item').val() == 'potential index by academicage'){
                    $('#academicage_label').removeClass('layui-hide');
                    $('#academicage_select').removeClass('layui-hide');
                    form.render();
                } else {
                    $('#period_label').addClass('layui-hide');
                    $('#period_select').addClass('layui-hide');
                    $('#academicage_label').addClass('layui-hide');
                    $('#academicage_select').addClass('layui-hide');
                    form.render();
                }
            });
        });
    });



</script>
<div id="result" style="position:absolute;top: 25%;left: 20%;opacity: 0.6">

</div>

<script type="text/javascript">
    $.ajax({
        type:"POST",
        url:'/rank/top100?type=cooperator number&&range=top10&&upOrDown=down&&period=null&&academicage=null',
        success:function (data) {
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
                    sortItemReg();
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
                        sortItemReg();
                    }
                });
            }
            else {
                $.ajax({
                    type:"POST",
                    url:'/rank/top100?type=' + $("#sort_item").val() + '&&range=' + $('#sort_range').val() + '&&upOrDown=' + $(this).attr('value') + '&&period=' + $("#potential_peroid").val() + '&&academicage=null',
                    success:function (data) {
                        $("#result").html(data);
                        sortItemReg();
                    }
                });
            }
        }

    });
</script>


<script src="/js/polygonizr.min.js"></script>
<script type="text/javascript">



    $("html").css("overflow", "initial");
    $("body").css("overflow", "initial");

    $('#site-landing').css('height', document.body.scrollHeight + 500);

    $('#site-landing').polygonizr();



</script>

</body>
</html>