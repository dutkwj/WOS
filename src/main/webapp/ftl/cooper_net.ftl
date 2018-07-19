<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="/css/cooper_net/fisheye.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="/css/cooper_net/d3v4-selectable-zoomable-force-directed-graph.css" media="screen"/>
    <link rel="stylesheet" href="/css/styleDialog.css">
</head>
<!-- <form style="margin-left: 20px"> -->
<body>
<input type="checkbox"  id="kaiguan" />&nbsp;magnifying-glass<br/>
<!-- <input type="radio" name="wot" id="path" value="two" checked />&nbsp;as path -->
<!-- </form> -->
<div id="d3_selectable_force_directed_graph" style="width: 1200px; height: 800px;">

    <!-- <div id="d3_selectable_force_directed_graph1" style="width: 960px; height: 500px;"> -->
    <svg />
</div>
<div style="width: 0px;float: left">
    <ul class="cd-items cd-container">
        <li class="cd-item">
        </li> <!-- cd-item -->
    </ul> <!-- cd-items -->
</div>
<div class="cd-quick-view" style="width: 0px;float: left;margin-top: 5%">
    <div class="cd-slider-wrapper">
        <ul class="cd-slider">
            <li class="selected"><img src="/img/images/users/scholarImg.png" ></li>
        </ul> <!-- cd-slider -->
    </div> <!-- cd-slider-wrapper -->

    <div class="cd-item-info">
        <h2 id="scholarName"></h2>
        <p style="font-size: 17px">P-index: <span id="q_index"></span> | H-index: <span id="h_index"></span></p>
        <p style="font-size: 17px">Affiliation: <span id="aff"></span></p>
        <p style="font-size: 17px">Study Field: <span id="studyField"></span></p>
        <ul class="cd-item-action">
            <li><button class="add-to-cart" id="relationship"  style="font-size: 17px">relationship network</button></li>
        <#--<li><a href="#0">Learn more</a></li>-->
        </ul> <!-- cd-item-action -->
    </div> <!-- cd-item-info -->
    <a href="#0" class="cd-close">Close</a>
</div>

<script src="/js/time_map/d3.v4.min.js"></script>
<script src="/js/time_map/d3.v3.min.js"></script>
<script src="/js/time_map/d3v4-brush-lite.js"></script>
<script src="/js/time_map/force.js"></script>
<script src="/js/time_map/fisheye.js"></script>
<script type="text/javascript" src="/js/time_map/echarts.min.js"></script>
<script src="/js/modernizr.js"></script>
<#--<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>-->
<#--2018 07 16 这里去掉jquery 重复引入可能导致后面的cookie.js失效!!!!!!!-->

<script src="/js/velocity.min.js"></script>
<script src="/js/mainDialog.js"></script>

<script>
    var dom = document.getElementById("d3_selectable_force_directed_graph");
    var myChart = echarts.init(dom);
    option = null;
    myChart.showLoading();
    var svg = d3.select('#d3_selectable_force_directed_graph');
    var index = "${scholarId!""}";
    var sliderFinalWidth = 300,
            maxQuickWidth = 900;
    // d3.json('data/miserables.with-ids.json', function(error, graph) {
    d3.json('/MVCJSON/${scholarId!""}', function(error, graph) {
        if (!error) {
           myChart.hideLoading();
            dom.innerHTML = "<svg />";
            createV4SelectableForceDirectedGraph(svg, graph,"${scholarId!""}");
        }else {
            console.error(error);
        }
    });

    $("#relationship").click(function () {
        var URL = '/cooperate/' + index + '/MVC';
    <#--<#if cooperateType?? && cooperateType=='directCooperate'>-->
        <#--URL = '/cooperate/' + index + '/directCooperate';-->
    <#--<#elseif cooperateType?? && cooperateType=='MVC'>-->
        <#--URL = '/cooperate/' + index + '/MVC';-->
    <#--<#elseif teamType?? && teamType=='weakTeam'>-->
        <#--URL = '/team/' + index + '/weakTeam';-->
    <#--<#elseif teamType?? && teamType=='middleTeam'>-->
        <#--URL = '/team/' + index + '/middleTeam';-->
    <#--<#elseif teamType?? && teamType=='strongTeam'>-->
        <#--URL = '/team/' + index + '/strongTeam';-->
    <#--<#elseif advisorType?? && advisorType=='tree'>-->
        <#--URL = '/Advisor-advisee/' + index + '/tree';-->
    <#--<#elseif advisorType?? && advisorType=='graph'>-->
        <#--URL = '/Advisor-advisee/' + index + '/graph';-->
    <#--<#elseif advisorType?? && advisorType=='reference'>-->
        <#--URL = '/Advisor-advisee/' + index + '/reference';-->
    <#--<#elseif advisorType?? && advisorType=='evalue'>-->
        <#--URL = '/Advisor-advisee/' + index + '/evalue';-->
    <#--<#elseif advisorType?? && advisorType=='student_number_year'>-->
        <#--URL = '/Advisor-advisee/' + index + '/student_number_year';-->
    <#--<#elseif refType?? && refType=='ref'>-->
        <#--URL = '/ref/' + index;-->
    <#--<#elseif refType?? && refType=='refed'>-->
        <#--URL = '/refed/' + index;-->
    <#--<#elseif refType?? && refType=='coRef'>-->
        <#--URL = '/coRef/' + index;-->
    <#--<#elseif refType?? && refType=='coRefed'>-->
        <#--URL = '/coRefed/' + index;-->
    <#--</#if>-->
        $.ajax({
            type:"POST",
            url:URL,
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
        closeQuickView(sliderFinalWidth, maxQuickWidth);
    });
    function animateQuickView(image, finalWidth, maxQuickWidth, animationType) {
        var parentListItem = image.parent('.cd-item'),
                topSelected = image.offset().top - $(window).scrollTop(),
                leftSelected = image.offset().left,

                widthSelected = image.width(),
                heightSelected = image.height(),
                windowWidth = $(window).width(),
                windowHeight = $(window).height(),
                finalLeft = (windowWidth - finalWidth)/2,
                finalHeight = finalWidth * heightSelected/widthSelected,
                finalTop = (windowHeight - finalHeight)/2,
                quickViewWidth = ( windowWidth * .8 < maxQuickWidth ) ? windowWidth * .8 : maxQuickWidth ,
                quickViewLeft = (windowWidth - quickViewWidth)/2;
        if( animationType == 'open') {
            parentListItem.addClass('empty-box');
            $('.cd-quick-view').css({
                "top": topSelected,
                "left": leftSelected,
                "width": widthSelected
            }).velocity({
                'top': finalTop+ 'px',
                'left': finalLeft+'px',
                'width': finalWidth+'px'
            }, 1000, [ 400, 20 ], function(){
                //animate the quick view: animate its width to the final value
                $('.cd-quick-view').addClass('animate-width').velocity({
                    'left': quickViewLeft+'px',
                    'width': quickViewWidth+'px'
                }, 300, 'ease' ,function(){
                    //show quick view content
                    $('.cd-quick-view').addClass('add-content');
                });
            }).addClass('is-visible');
        }　else {
            //close the quick view reverting the animation
            $('.cd-quick-view').removeClass('add-content').velocity({
                'top': finalTop+ 'px',
                'left': finalLeft+'px',
                'width': finalWidth+'px',
            }, 300, 'ease', function(){
                $('body').removeClass('overlay-layer');
                $('.cd-quick-view').removeClass('animate-width').velocity({
                    "top": topSelected,
                    "left": leftSelected,
                    "width": widthSelected,
                }, 500, 'ease', function(){
                    $('.cd-quick-view').removeClass('is-visible');
                    parentListItem.removeClass('empty-box');
                });
            });
        }
    }

    function updateQuickView(url) {
        $('.cd-quick-view .cd-slider li').removeClass('selected').find('img[src="'+ url +'"]').parent('li').addClass('selected');
    }

    function closeQuickView(finalWidth, maxQuickWidth) {
        var close = $('.cd-close'),
                activeSliderUrl = close.siblings('.cd-slider-wrapper').find('.selected img').attr('src'),
                selectedImage = $('.empty-box').find('img');
        //update the image in the gallery
        if( !$('.cd-quick-view').hasClass('velocity-animating') && $('.cd-quick-view').hasClass('add-content')) {
            selectedImage.attr('src', activeSliderUrl);
            animateQuickView(selectedImage, finalWidth, maxQuickWidth, 'close');
        } else {
            closeNoAnimation(selectedImage, finalWidth, maxQuickWidth);
        }
        $('.cd-item').empty();
    }

    function closeNoAnimation(image, finalWidth, maxQuickWidth) {
        var parentListItem = image.parent('.cd-item');
        console.log(parentListItem.html());
               var topSelected = image.offset().top - $(window).scrollTop(),
                leftSelected = image.offset().left,
                widthSelected = image.width();

        //close the quick view reverting the animation
        $('body').removeClass('overlay-layer');
        parentListItem.removeClass('empty-box');
        $('.cd-quick-view').velocity("stop").removeClass('add-content animate-width is-visible').css({
            "top": topSelected,
            "left": leftSelected,
            "width": widthSelected,
        });
    }

</script>
</body>
</html>