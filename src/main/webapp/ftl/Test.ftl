<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>stickUp - a free jQuery Plugin</title>

    <!-- Bootstrap & Snippet plugin core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../stickup.css" rel="stylesheet">
</head>
<body>
<!-- START THE COVER -->
<div id="home" class="carousel">
    <div class="carousel-inner">
        <div class="item active">
            <div class="container">
                <div class="carousel-caption">
                    <h1>stickUp</h1>
                    <h3>a jQuery plugin</h4>
                        <p>A simple plugin that <i>"sticks"</i> an element to the top of the browser window while scrolling past it, always keeping it in view.  This plugin works on multi-page sites, but has additional features for one-pager layouts.</p>
                        <p><a class="btn btn-large btn-success" href="http://github.com/LiranCohen/stickUp"><b>Visit GitHub</b></a></p>
                </div>
            </div>
        </div>
    </div><!-- END COVER -->

    <!-- START THE NAVBAR -->
    <div class="navbar-wrapper">





        <ul class="nav navbar-nav">
            <li class="menuItem active"><a href="#home">Home</a></li>
            <li class="menuItem"><a href="#features">Features</a></li>
            <li class="menuItem"><a href="#updates">Updates</a></li>
            <li class="menuItem"><a href="#installation">Installation</a></li>
            <li class="menuItem"><a href="#one-pager">One Pager</a></li>
            <li class="menuItem"><a href="#extras">Extras</a></li>
            <li class="menuItem"><a href="#wordpress">Wordpress</a></li>
            <li class="menuItem"><a href="#contact">Contact</a></li>
        </ul>






    </div> <!-- END NAVBAR -->

    <!-- START THE CONTENT -->
    <div id='contents'>

        <!-- START THE FEATURES -->
        <div id="features" class="row featurette container marketing">
            <center><h4 style='margin-bottom:0px;margin-top:20px;'>by <b>Liran Cohen</b></h4>
                <h5 style='margin-top:5px;'><mute>v0.4.5 BETA</mute></h5></center>
            <!-- Three columns of text -->
            <div class="row">
                <div class="col-lg-4">
                    <img src="images/simple.png">
                    <h2>Simple Integration</h2>
                    <p><b>stickUp</b> is a jQuery plugin, which you can implement on any webpage alongside jQuery. You can easily make <i>any</i> element, on <i>any</i> page, stick to the top of the browser window as the user scrolls past it.  This feature is excellent for navigation menus, logos and/or contact information, which you may want the user to see at all times.</p>
                    <p><a class="btn btn-default" href="#installation">View details &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img src="images/onepager.png">
                    <h2>The "One Pager"</h2>
                    <p>Although <b>stickUp</b> was made to work on any kind of website, it was originally designed for the <i>"one-pager"</i> style of websites.  By using CSS the sticky navigation menu item will be highlighted as it's correlating content is crolled in and out of view.</p>
                    <p><a class="btn btn-default" href="#one-pager">View details &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img src="images/opensource.png">
                    <h2>Open Source</h2>
                    <p>The GNU Lesser General Public License is a free software license published by the Free Software Foundation. The LGPL allows developers and companies to use and integrate LGPL software into their own (even proprietary) software without being required (by the terms of a strong copyleft) to release the source code of their own software-parts.</p>
                    <p><a class="btn btn-default" href="http://www.gnu.org/licenses/lgpl.html">View details &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
            </div><!-- /.row -->
        </div> <!-- END FEATURES -->

        <!-- START THE UPDATES -->
        <div id="updates" class="row featurette">
            <div class="col-lg-12">
                <h2 class="featurette-heading">Updates</h2>
            </div>
            <div class="col-lg-offset-1 col-lg-10">
                <h3>Beta version is available! <small><b><i>Nov 1st, 2013</i></b></small></h3>
                <p>The first version of the <b><i>stickUp</i></b> jQuery plugin has oficially been launched. This is still in Beta and there may be a few bugs, but they are will get sorted out in the coming weeks. Pleaes contact us if you experience any troubles. Check back often for updates on new features.
                </p>
            </div>
            <div class="col-lg-offset-1 col-lg-10">
                <h3>"One Pager" anchor functionality. <small><b><i>Oct 31st, 2013</i></b></small></h3>
                <p>Decided to add anchor functionality so that as certain sections of a 'One Pager' style website, like this one, could trigger a CSS change as they're scrolled into view.  That way your users know where they are while they're scrolling through content.  More options are coming for this in the future.
                </p>
            </div>
            <div class="col-lg-offset-1 col-lg-10">
                <h3>In need of Margin... <small><b><i>Oct 30th, 2013</i></b></small></h3>
                <p>When I initially made the plugin the goal was to make the element stick to the very top, but after deciding to make an official example page for it I realizd that I loved the look of a floating plugin.  So I added a little feature called <b><i>marginTop</i></b> to the mix.  This allows the element to be caught by it's margin rather than when it hits the top of the page.
                </p>
            </div>
            <div class="col-lg-offset-1 col-lg-10">
                <h3>stickUp is Alive! <small><b><i>Oct 29th, 2013</i></b></small></h3>
                <p>I've decided to create a plugin out of necessity.  There are plenty of "sticky nav" jQuery plugins available out there, but none of them seem to work as smoothly as I'd like.  I decided to create my own and out of that stickUp was born! It's not perfect and has it's kinks, but they will be worked out over the coming weeks.
                </p>
            </div>
        </div> <!-- END UPDATES -->











    </div> <!-- END CONTENT -->


    <!-- Bootstrap & Plugins core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <!-- ### IMPORTANT ### stickUp javascript file -->
    <!-- ######################################### -->
    <script src="../js/stickUp.min.js"></script>
    <!-- ######################################### -->

    <!-- ### IMPORTANT ### stickUp options in use -->
    <!-- ######################################## -->
    <script type="text/javascript">
        jQuery(function($) {
            $(document).ready( function() {
                $('.navbar-wrapper').stickUp();
            });
        });
    </script>
    <!-- ######################################## -->
</body>
</html>