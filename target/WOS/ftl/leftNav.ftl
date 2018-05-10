<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="/css/nav/leftnav.css" media="screen" type="text/css"/>
    <script src='/js/jquery-3.2.1.min.js'></script>
    <script src='/js/nav/leftnav.js'></script>
</head>
<body style="background-color: #ffffff">
<div class="account-l fl" style="width:12%;float: left;margin-left: 5%;margin-top: 3%">
    <a class="list-title" href="/index">Web of Scholars</a>
    <ul id="accordion" class="accordion">
        <li class="open">
            <div class="link">cooperate<i class="fa fa-chevron-down"></i></div>
            <ul class="submenu" style="display: block;">
                <li class="current"><a id="directCooperate">direct cooperate</a></li>
                <li><a id="mvc">MVC</a></li>
                <li><a id="collLocation">collaborator location</a></li>
                <li><a id="collNumber">collaborator number</a></li>
            </ul>
        </li>
        <li>
            <div class="link">team<i class="fa fa-chevron-down"></i></div>
            <ul class="submenu">
                <li><a id="weakTeam">weak team</a></li>
                <li><a id="middleTeam">middle team</a></li>
                <li><a id="strongTeam">strong team</a></li>
            </ul>
        </li>
        <li>
            <div class="link" id="tea_main">Advisor-advise<i class="fa fa-chevron-down"></i></div>
            <ul class="submenu">
                <li><a id="influence">Influence</a></li>
                <li><a id="tree">Tree</a></li>
                <li><a id="graph">Graph</a></li>
                <li><a id="evalue">Evalue</a></li>
            </ul>
        </li>
        <li>
            <div class="link">cite<i class="fa fa-chevron-down"></i></div>
            <ul class="submenu">
                <li><a id="directCite">direct cite</a></li>
                <li><a id="directCited">direct cited</a></li>
                <li><a id="commonCite">common cite</a></li>
                <li><a id="commonCited">common cited</a></li>
            </ul>
        </li>
    </ul>
</div>
<div id="bigContainer" style="width: 75%;height: 100%;margin-left:2%;float: left">
</div>

<script type="text/javascript">
    $.ajax({
        type:"POST",
        url:'/cooperate/${scholarId!""}/directCooperate',
        success:function (data) {
            $("#bigContainer").html(data);
        }
    });
    $("#directCooperate").click(function () {
        $.ajax({
            type:"POST",
            url:'/cooperate/${scholarId!""}/directCooperate',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#mvc").click(function () {
        $.ajax({
            type:"POST",
            url:'/cooperate/${scholarId!""}/MVC',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#collLocation").click(function () {
        $.ajax({
            type:"POST",
            url:'/cooperate/${scholarId}/worldMap',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#collNumber").click(function () {
        $.ajax({
            type:"POST",
            url:'/cooperate/${scholarId}/yearCounts',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#weakTeam").click(function () {
        $.ajax({
            type:"POST",
            url:'/team/${scholarId!""}/weakTeam',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#middleTeam").click(function () {
        $.ajax({
            type:"POST",
            url:'/team/${scholarId!""}/middleTeam',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#strongTeam").click(function () {
        $.ajax({
            type:"POST",
            url:'/team/${scholarId!""}/strongTeam',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#directCite").click(function () {
        $.ajax({
            type:"POST",
            url:'/ref/${scholarId!""}',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#directCited").click(function () {
        $.ajax({
            type:"POST",
            url:'/refed/${scholarId!""}',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#commonCite").click(function () {
        $.ajax({
            type:"POST",
            url:'/coRef/${scholarId!""}',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });

    $("#commonCited").click(function () {
        $.ajax({
            type:"POST",
            url:'/coRefed/${scholarId!""}',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });
    $("#tea_main").click(function () {
        $.ajax({
            type:"POST",
            url:'/Advisor-advisee/${scholarId!""}/tea_stu_main',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });
    $("#influence").click(function () {
        $.ajax({
            type:"POST",
            url:'/Advisor-advisee/${scholarId!""}/influence',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });
    $("#tree").click(function () {
        $.ajax({
            type:"POST",
            url:'/Advisor-advisee/${scholarId!""}/tree',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });
    $("#graph").click(function () {
        $.ajax({
            type:"POST",
            url:'/Advisor-advisee/${scholarId!""}/graph',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });
    $("#evalue").click(function () {
        $.ajax({
            type:"POST",
            url:'/Advisor-advisee/${scholarId!""}/evalue',
            success:function (data) {
                $("#bigContainer").html(data);
            }
        });
    });
</script>

</body>
</html>