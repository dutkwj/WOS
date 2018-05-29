<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/styleDialog.css">
    <script src="/js/modernizr.js"></script>
</head>
<body style="height: 100%;">
<div style="width: 0px;float: left">
    <ul class="cd-items cd-container">
        <li class="cd-item">
        </li> <!-- cd-item -->
    </ul> <!-- cd-items -->
</div>
<div class="cd-quick-view" style="width: 0px;float: left;margin-top: 5%">
    <div class="cd-slider-wrapper">
        <ul class="cd-slider">
            <li class="selected"><img src="/img/scholarImg.png" ></li>
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

<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
<script src="/js/velocity.min.js"></script>
<script src="/js/mainDialog.js"></script> <!-- Resource jQuery -->

<div id="container" style="height: 100%;">
</div>

<script type="text/javascript" src="/js/echars/echarts.min.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    option = null;
    myChart.showLoading();
    var URL = '/directCooperateJSON/${scholarId!""}';
    <#if cooperateType?? && cooperateType=='directCooperate'>
    URL = '/directCooperateJSON/${scholarId!""}';
    <#elseif cooperateType?? && cooperateType=='MVC'>
    URL = '/MVCJSON/${scholarId!""}';
    <#elseif teamType?? && teamType=='weakTeam'>
    URL = '/teamJSON/${scholarId!""}/weakTeam';
    <#elseif teamType?? && teamType=='middleTeam'>
    URL = '/teamJSON/${scholarId!""}/middleTeam';
    <#elseif teamType?? && teamType=='strongTeam'>
    URL = '/teamJSON/${scholarId!""}/strongTeam';
    <#elseif advisorType?? && advisorType=='tea_stu_main'>
    URL = '/advisorJSON/${scholarId!""}/tea_stu_main';
    <#elseif advisorType?? && advisorType=='influence'>
    URL = '/advisorJSON/${scholarId!""}/influence';
    <#elseif advisorType?? && advisorType=='tree'>
    URL = '/advisorJSON/${scholarId!""}/tree';
    <#elseif advisorType?? && advisorType=='graph'>
    URL = '/advisorJSON/${scholarId!""}/graph';
    <#elseif advisorType?? && advisorType=='evalue'>
    URL = '/advisorJSON/${scholarId!""}/evalue';
    <#elseif refType?? && refType=='ref'>
    URL = '/refJSON/${scholarId!""}';
    <#elseif refType?? && refType=='refed'>
    URL = '/refedJSON/${scholarId!""}';
    <#elseif refType?? && refType=='coRef'>
    URL = '/coRefJSON/${scholarId!""}';
    <#elseif refType?? && refType=='coRefed'>
    URL = '/coRefedJSON/${scholarId!""}';
    </#if>
    $.getJSON(URL, function (webkitDep) {
        myChart.hideLoading();
        option = {
            series: [{
                type: 'graph',
                layout: 'force',
                animation: false,
                label: {
                    normal: {
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                draggable: true,
                data: webkitDep.nodes.map(function (node, idx) {
                    return {
                        id:node.id,
                        name:node.name,
                        qindex:node.qindex,
                        hindex:node.hindex,
                        aff:node.aff,
                        studyField:node.studyField,
                        symbolSize: node.size,
                        itemStyle: {
                            normal: {
                                color: node.color
//                                opacity: node.size > 10? 1: 0.2
                            }
                        },
                        label : {
                            normal: {
                                show: node.size > 10,
                                color:'black'
                            }
                        }
                    };
                }),
//                categories: webkitDep.categories,
                force: {
                <#if cooperateType?? && cooperateType=='MVC'>
                    edgeLength: 30,
                    repulsion: 20,
                <#elseif cooperateType?? && cooperateType=='directCooperate'>
                    edgeLength: 80,
                    repulsion: 80,
                <#elseif teamType?? && teamType=='weakTeam'>
                    edgeLength: 100,
                    repulsion: 250,
                <#elseif teamType?? && teamType=='middleTeam'>
                    edgeLength: 150,
                    repulsion: 400,
                <#elseif teamType?? && teamType=='strongTeam'>
                    edgeLength: 200,
                    repulsion: 600,
                <#elseif refType?? && (refType=='ref' || refType=='refed' || refType=='coRef' || refType=='coRefed')>
                    edgeLength: 20,
                    repulsion: 80,
                </#if>
                    gravity: 0.2

                },
                edges:webkitDep.links.map(function (link) {
                    return {
                        source: link.source,
                        target: link.target,
                        lineStyle: {
                            normal: {
                            <#if cooperateType?? && (cooperateType=='directCooperate' || cooperateType=='MVC')>
                                width: link.coCount,
                            <#elseif teamType?? && (teamType=='weakTeam' || teamType=='middleTeam' || teamType=='strongTeam')>
                                width: 2,
                            <#elseif refType?? && (refType=='ref' || refType=='refed' || refType=='coRef' || refType=='coRefed')>
                                width: 2,
                            </#if>
                                curveness: 0.2
//                                opacity: link.coCount > 8? 1: 0.2
                            }
                        }
                    };
                }),
                focusNodeAdjacency: true
            }]
        };
        myChart.setOption(option);
    });
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }

    var sliderFinalWidth = 300,
            maxQuickWidth = 900;
    var index = "${scholarId!""}";
    myChart.on('click', function (params) {
        $('#q_index').html(params.data.qindex);
        $('#h_index').html(params.data.hindex);
        $('#aff').html(params.data.aff);
        $('#studyField').html(params.data.studyField);
        $('#scholarName').html(params.data.name);
        index = params.data.id;
        $('.cd-item').append('<img src="/img/scholarImg.png" >');
        var selectedImage = $('.cd-item').children('img'),
                slectedImageUrl = selectedImage.attr('src');

        $('body').addClass('overlay-layer');
        animateQuickView(selectedImage, sliderFinalWidth, maxQuickWidth, 'open');
        updateQuickView(slectedImageUrl);

    });

    $("#relationship").click(function () {
        var URL = '/cooperate/' + index + '/directCooperate';
        <#if cooperateType?? && cooperateType=='directCooperate'>
            URL = '/cooperate/' + index + '/directCooperate';
        <#elseif cooperateType?? && cooperateType=='MVC'>
            URL = '/cooperate/' + index + '/MVC';
        <#elseif teamType?? && teamType=='weakTeam'>
            URL = '/team/' + index + '/weakTeam';
        <#elseif teamType?? && teamType=='middleTeam'>
            URL = '/team/' + index + '/middleTeam';
        <#elseif teamType?? && teamType=='strongTeam'>
            URL = '/team/' + index + '/strongTeam';
        <#elseif advisorType?? && advisorType=='tea_stu_main'>
            URL = '/Advisor-advisee/' + index + '/tea_stu_main';
        <#elseif advisorType?? && advisorType=='influence'>
            URL = '/Advisor-advisee/' + index + '/influence';
        <#elseif advisorType?? && advisorType=='tree'>
            URL = '/Advisor-advisee/' + index + '/tree';
        <#elseif advisorType?? && advisorType=='graph'>
            URL = '/Advisor-advisee/' + index + '/graph';
        <#elseif advisorType?? && advisorType=='evalue'>
            URL = '/Advisor-advisee/' + index + '/evalue';
        <#elseif refType?? && refType=='ref'>
            URL = '/ref/' + index;
        <#elseif refType?? && refType=='refed'>
            URL = '/refed/' + index;
        <#elseif refType?? && refType=='coRef'>
            URL = '/coRef/' + index;
        <#elseif refType?? && refType=='coRefed'>
            URL = '/coRefed/' + index;
        </#if>
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
        var parentListItem = image.parent('.cd-item'),
                topSelected = image.offset().top - $(window).scrollTop(),
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