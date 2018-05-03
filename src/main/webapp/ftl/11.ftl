<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>11</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${path}/css/layui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/buttons.css" type="text/css">
    <link href="../css/bootstrap-teastu.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../css/style-teastu.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../css/jquery.easy-gallery.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/stickup.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/templatemo-style.css">
    <script src="../js/jquery-2.1.4.min.js" charset="utf-8"></script>
    <script src="../js/echarts.min.js" charset="utf-8"></script>
    <script src="../js/echarts-gl.min.js" charset="utf-8"></script>
    <script src="../js/ecStat.min.js" charset="utf-8"></script>
    <script src="../js/dataTool.min.js" charset="utf-8"></script>
    <script src="../js/bootstrap.js" charset="utf-8"></script>
    <script src="../js/counterup.min.js" charset="utf-8"></script>
    <script src="../js/bmap.min.js" charset="utf-8"></script>
    <script src="../js/easing.js" charset="utf-8"></script>
    <script src="../js/jquery.easy-gallery.js" charset="utf-8"></script>
    <script src="../js/simplex.js" charset="utf-8"></script>
    <script src="../js/jquery.magnific-popup.js" charset="utf-8"></script>
    <script src="../js/move-top.js" charset="utf-8"></script>
    <script src="../js/waypoints.min.js" charset="utf-8"></script>
    var data = ${scholarID!""};
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!-- start-smoth-scrolling -->

</head>

<body style="background-color: #EE9A00">
<!-- banner -->
<div class="banner">
    <div class="container">
        <div class="header">
            <div class="logo">
                <h1><a href="#">Teacher-student relation <span>Web of Scholars</span></a></h1>
            </div>
            <div class="mail-phone">
                <ul>
                    <li><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>+1234 568 695</li>
                    <li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">info@example.com</a></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="banner-info">
            <ul class="nav nav-tabs" id="nav_relation">
                <li class="active"><a href="index.html">Home</a></li>
                <li><a href="/network/baseInfo?scholarId=' + data'" class="scroll hvr-radial-out">Network</a></li>
                <li><a href="#" class="scroll hvr-radial-out">Collation</a></li>
                <li><a href="#" class="scroll hvr-radial-out">Influence</a></li>
                <li><a href="#" class="scroll hvr-radial-out">Tendency</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- //for bootstrap working -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function() {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<!-- //here ends scrolling icon -->
</body>
</html>