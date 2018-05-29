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
    <#--<script type="text/javascript" src="/js/layui.all.js" charset="utf-8"></script>-->

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
            <li style="background:none"><a href="#" style="color:#ffffcc">Relationship</a>
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
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px;background-color: #ffffff;opacity: 0.6">
        <form class="layui-form" id="searchForm" style="margin-right: 10px">

            <div class="layui-form-item">
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">scholar</label>
                <div class="layui-input-block">
                    <input type="text" name="scholarName" lay-verify="title" autocomplete="off" placeholder="scholar name" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">affiliation</label>
                <div class="layui-input-block">
                    <input type="text" name="affName" lay-verify="title" autocomplete="off" placeholder="affiliation name" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 110px;text-align: left">p-index</label>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="minQindex" placeholder="start" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">-</div>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="maxQindex" placeholder="end" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 110px;text-align: left">h-index</label>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="minHindex" placeholder="start" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">-</div>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="maxHindex" placeholder="end" autocomplete="off" class="layui-input">
                </div>
            </div>

        </form>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" id="searchButton">search</button>
            </div>
        </div>
    </fieldset>
</div>

<div class="layui-container" style="position:absolute;top: 45%;left: 20%;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;border-width: 1px;background-color: #ffffff;opacity:0.6;">
        <form id="sort_form" class="layui-form" action="" style="margin-right: 10px">
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
        </form>
    </fieldset>
</div>
<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>
<div id="result" style="position:absolute;top: 60%;left: 20%;opacity: 0.6">
</div>

<script type="text/javascript">


    $.ajax({
        type:"POST",
        url:'/searchMore/init',
        success:function (data) {
            $("#result").html(data);

        }
    });

    $("#searchButton").on("click", function () {
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

<script src="/js/polygonizr.min.js"></script>
<script type="text/javascript">

    $("html").css("overflow", "initial");
    $("body").css("overflow", "initial");

    $('#site-landing').css('height', document.body.scrollHeight + 800);

    $('#site-landing').polygonizr();

</script>



</body>
</html>