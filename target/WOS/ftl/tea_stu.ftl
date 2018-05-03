<#assign path="${request.getContextPath()}">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>tea_stu</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${path}/css/layui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/buttons.css" type="text/css">
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/stickup.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/templatemo-style.css">

    <style type="text/css">
        .aaaa {
            background-color:#26abe2;
            font-size: 250px;
            text-align: center;
            padding-top: 30px;
        }

    </style>

</head>
<body>
<div class="aaaa">
    <h2 class="docs-header" style="color: #ffffff;height: 100px;text-align:center: ">Teacher-student Relation</h2>
</div>
<div class="container" style="background-color: #f5f5f5; margin-top: 100px;margin-right: 0px;margin-bottom: 0px;margin-left: 20px;; padding-top: 15px;padding-right: 20px;padding-bottom: 15px;padding-left: 20px;
list-style: none;list-style-type: none;list-style-image: none;list-style-position: outside;font-size: 0.97em;width: 220px">
    <ul id="menu-left" class="daohang">
        <li>
            <strong>jiaodu</strong>
        </li>
        <li>
            <a class="",herf="/searchMore/index">ji</a>
        </li>
        <li>
            <a class="",herf="/searchMore/index">jia</a>
        </li>
    </ul>
</div>
<script type="text/javascript" src="../js/layui.all.js" charset="utf-8"></script>
<script src="../js/jquery.js"></script>
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
</body>
</html>