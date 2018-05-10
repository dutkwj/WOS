<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>index</title>
    <link rel="stylesheet" href="/css/layui.css" type="text/css">
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/templatemo-style.css">

</head>
<body>



<#--<div class="layui-col-md9" style="border-left: 1px solid #eee;border-right: 1px solid #eee;">-->
    <div class="row tm-media-row" style="height:100%;background-color: #ffffff">
        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
            <img src="../img/scholarImg.png" style="width: 100%" alt="Image" class="img-circle tm-media-img">
        </div>
        <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
            <div class="tm-media-text-container">
                <h3 class="tm-media-title tm-gray-text" style="font-size:30px"><a style="text-decoration: none" href="/relationGraph/${middleScholar.index!""}/directCooperate">${middleScholar.name!""}</a>
                </h3>
                <p class="tm-media-description tm-gray-text-2" style="font-size:20px">Q-index: ${middleScholar.qindex!""} | H-index: ${middleScholar.hindex!""} <br/>
                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;Affiliation: ${middleScholar.aff!""} <br/>
                    <span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;StudyField: ${middleScholar.fieldName!""}
                </p>
            </div>
        </div>
    </div>
<#--</div>-->


</body>
</html>