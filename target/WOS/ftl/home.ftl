<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/htmleaf-demo.css">
    <link rel="stylesheet" href="/css/csslider.default.css" />
    <link rel="stylesheet" href="/css/inner.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/topNavStyle.css">

    <script src='/js/jquery-3.2.1.min.js'></script>
    <script src="/js/megamenu.js"></script>
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
            height: 100%;
            width: 100%;
            background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
        }
        .wrapper {
            height: 60px;
            width: 460px;
            border-radius: 4px;
            box-shadow: 0 2px 2px rgba(0, 0, 0, .15);
            position: absolute;
            top: 30%;
            left: 22%;
            margin-left: -230px;
            margin-top: -30px;
        }
        .wos-data {
            position: absolute;
            top: 38%;
            left: 10%;
        }

        .inputbox {
            box-sizing: border-box;
            width: 400px;
            height: 100%;
            font-size: 22px;
            background-color: #ffffff;
            border: 2px solid #ffffff;
            border-right: 0;
            border-radius: 4px 0 0 4px;
            padding: 10px;
            float: left;
            display: block;
        }

        .submit {
            height: 100%;
            width: 60px;
            float: left;
            border: 2px solid #ffffff;
            border-left: 0;
            box-sizing: border-box;
            background-color: #ffffff;

            border-radius: 0 4px 4px 0;
            text-indent: -200em;
            overflow: hidden;
            display: block;
            cursor: pointer;

            background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNy43NSAzNy43NSI+PHBhdGggZD0iTTQyLjA4LDM3LjYxbC04LjItOC4yLS4xNC0uMTFhMTUuNTMsMTUuNTMsMCwxLDAtNC40NCw0LjQ0cy4wNy4xLjExLjE0bDguMiw4LjJhMy4xNSwzLjE1LDAsMSwwLDQuNDYtNC40NlptLTIxLjMxLTYuN0ExMC4xNCwxMC4xNCwwLDEsMSwzMC45MSwyMC43NywxMC4xNCwxMC4xNCwwLDAsMSwyMC43NywzMC45MVptMCwwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNS4yNSAtNS4yNSkiIHN0eWxlPSJmaWxsOiM1ODU4NTg7ZmlsbC1ydWxlOmV2ZW5vZGQiLz48L3N2Zz4=);

            background-size: 28px auto;
            background-repeat: no-repeat;
            background-position: center center;

        }
        input:focus {
            outline: none;
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
        <ul>
            <li style="background:none"><a href="/index" style="color:#ffffcc">Home</a></li>
            <li style="background:none"><a href="http://marioloncarek.com" style="color:#ffffcc">Relationship</a>
                <ul>
                    <li><a href="#">Cooperate</a>
                        <ul>
                            <li><a href="/relationGraph/0CAEADF8/directCooperate">Cooperate Graph</a></li>
                            <li><a href="/relationGraph/0CAEADF8/MVC">Most Valuable Collaborators</a></li>
                            <li><a href="/relationGraph/0CAEADF8/collaLocation">Collaborators Location</a></li>
                            <li><a href="/relationGraph/0CAEADF8/collaNumber">Collaborators Number</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Team</a>
                        <ul>
                            <li><a href="/relationGraph/0CAEADF8/strongTeam">Strong Team</a></li>
                            <li><a href="/relationGraph/0CAEADF8/middleTeam">Middle Team</a></li>
                            <li><a href="/relationGraph/0CAEADF8/weakTeam">Weak Team</a></li>
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
                            <li><a href="/relationGraph/0CAEADF8/directCite">direct Cite</a></li>
                            <li><a href="/relationGraph/0CAEADF8/directCited">direct Cited</a></li>
                            <li><a href="/relationGraph/0CAEADF8/commonCite">Common Cite</a></li>
                            <li><a href="/relationGraph/0CAEADF8/commonCited">Common Cited</a></li>
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
        </ul>
    </div>
</div>

<form class="wrapper" action="/searchMore/content">
    <input class="inputbox" style="opacity: 0.6" type="text" name="scholarName" id="search" placeholder="input scholar name...">
    <input class="submit" style="opacity:0.6" type="submit" value="Search">
</form>

<div class="wos-data">
    <span class="counter">1,458,510 &nbsp;&nbsp;&nbsp; papers</span>
    <span class="counter">1,746,281 &nbsp;&nbsp;&nbsp; scholars</span>
</div>

<div class="htmleaf-container" style="position: absolute;top:20%;left:35%">
    <header class="htmleaf-header" style="background:none">
        <div style="padding: 1em 0;">
            <div id="slider1" class="csslider">
                <input type="radio" name="slides" id="slides_1" checked="checked"/>
                <input type="radio" name="slides" id="slides_2"  />
                <input type="radio" name="slides" id="slides_3" />
                <input type="radio" name="slides" id="slides_4" />
                <ul style="border: 1px solid #ffffff;height: 300px;background:#ffffff;opacity:0.6;border-radius:30px 30px 30px 30px">
                    <li>
                        <div id="c1" style="height:100%;margin-left:10px;margin-right:10px;background: none"></div>
                    </li>
                    <li>
                        <div id="c2" style="height:100%;margin-left:10px;margin-right:10px"></div>
                    </li>
                    <li>
                        <div id="c3" style="height:100%;margin-left:10px;margin-right:10px"></div>
                    </li>
                    <li>
                        <div id="c4" style="height:100%;margin-left:10px;margin-right:10px"></div>
                    </li>
                </ul>
                <div class="arrows">
                    <label for="slides_1"></label>
                    <label for="slides_2"></label>
                    <label for="slides_3"></label>
                    <label for="slides_4"></label>
                </div>
                <div class="navigation">
                    <div>
                        <label for="slides_1"></label>
                        <label for="slides_2"></label>
                        <label for="slides_3"></label>
                        <label for="slides_4"></label>
                    </div>
                </div>
            </div>
        </div>
</div>

<ul class="banners_cycle" style="position: absolute;top:67%;left:20%;">
    <li class="banners_item style-1 ">
        <div class="tail">
            <div class="inner"><i class="fontawesome-icon medium circle-yes icon-globe"></i>
                <h4>Cooperate</h4>
                <p>This part describe the cooperate relationship between scholar and scholar.</p>
                <a href="/relationGraph/0CAEADF8/directCooperate" class="button">Access</a> </div>
        </div>
    </li>
    <li class="banners_item style-2 nomargin">
        <div class="tail">
            <div class="inner"><i class="fontawesome-icon medium circle-yes icon-lightbulb"></i>
                <h4>Team</h4>
                <p>This part describe the team relationship between scholar and scholar.</p>
                <a href="/relationGraph/0CAEADF8/strongTeam" class="button">Access</a> </div>
        </div>
    </li>
    <li class="banners_item style-3 ">
        <div class="tail">
            <div class="inner"><i class="fontawesome-icon medium circle-yes icon-link"></i>
                <h4>Advisor-advise</h4>
                <p>This part describe the Advisor-advise relationship between scholar and scholar.</p>
                <a href="#" class="button">Access</a> </div>
        </div>
    </li>
    <li class="banners_item style-4 nomargin">
        <div class="tail">
            <div class="inner"><i class="fontawesome-icon medium circle-yes icon-hand-down"></i>
                <h4>Direct cite</h4>
                <p>This part describe the direct cite relationship between scholar and scholar.</p>
                <a href="/relationGraph/0CAEADF8/directCite" class="button">Access</a> </div>
        </div>
    </li>
    <li class="banners_item style-5 ">
        <div class="tail">
            <div class="inner"><i class="fontawesome-icon medium circle-yes icon-upload-alt"></i>
                <h4>Common cite</h4>
                <p>This part describe the common cite relationship between scholar and scholar.</p>
                <a href="/relationGraph/0CAEADF8/commonCite" class="button">Access</a> </div>
        </div>
    </li>
    <li class="banners_item style-6 nomargin">
        <div class="tail">
            <div class="inner"><i class="fontawesome-icon medium circle-yes icon-text-width"></i>
                <h4>common cited</h4>
                <p>This part describe the common cited relationship between scholar and scholar.</p>
                <a href="/relationGraph/0CAEADF8/commonCited" class="button">Access</a> </div>
        </div>
    </li>
</ul>

<script src="/js/polygonizr.min.js"></script>
<script type="text/javascript">
    $('#site-landing').polygonizr();
</script>


<script type="text/javascript">
    $.ajax({
        type:"POST",
        url:'/scholar/baseInfo?authorId=0CAEADF8',
        success:function (data) {
            $("#c1").html(data);
        }
    });
    $.ajax({
        type:"POST",
        url:'/scholar/baseInfo?authorId=7B374211',
        success:function (data) {
            $("#c2").html(data);
        }
    });
    $.ajax({
        type:"POST",
        url:'/scholar/baseInfo?authorId=6AECDE8A',
        success:function (data) {
            $("#c3").html(data);
        }
    });
    $.ajax({
        type:"POST",
        url:'/scholar/baseInfo?authorId=7CEFBC45',
        success:function (data) {
            $("#c4").html(data);
        }
    });

//    window.setInterval("autoSlide()", 3000);
    var index = 0;
    function autoSlide() {
        index = index + 1;
        if (index > 4) {
            index = 1;
        }
        var slideIndex = "#slides_" + index;
        $("input").removeAttr("checked");
        $(slideIndex).attr("checked", "checked");
    }


</script>


<script type="text/javascript">

    jQuery(function(){
        jQuery('ul.banners_cycle li').mouseenter(function(){
            jQuery(this).find('.button').stop(false,true).fadeIn();
        });
        jQuery('ul.banners_cycle li').mouseleave(function(){
            jQuery(this).find('.button').stop(false,true).fadeOut();
        });
        jQuery('ul.banners_cycle li:not(.style-1)').mouseenter(function(){
            jQuery(this).css('z-index','6');
            jQuery(this).stop(false, true).animate({right:'-64px'}, {easing:"swing", duration: 300});
            jQuery(this).animate({right:'0'});
        });
        jQuery('ul.banners_cycle li:not(.style-1)').mouseleave(function(){
            jQuery(this).stop(false, true).animate({right:'-64px'});
            jQuery(this).stop(false, true).animate({right:'0'}, 'slow');
        });
        jQuery('ul.banners_cycle li.style-2').mouseleave(function(){
            jQuery(this).css('z-index','5');
        });
        jQuery('ul.banners_cycle li.style-3').mouseleave(function(){
            jQuery(this).css('z-index','4');
        });
        jQuery('ul.banners_cycle li.style-4').mouseleave(function(){
            jQuery(this).css('z-index','3');
        });
        jQuery('ul.banners_cycle li.style-5').mouseleave(function(){
            jQuery(this).css('z-index','2');
        });
        jQuery('ul.banners_cycle li.style-6').mouseenter(function(){
            jQuery('body').css('overflow-x','hidden');
        });
        jQuery('ul.banners_cycle li.style-6').mouseleave(function(){
            jQuery(this).css('z-index','1');
            jQuery('body').css('overflow-x','hidden');
        });
    });
</script>
</body>
</html>