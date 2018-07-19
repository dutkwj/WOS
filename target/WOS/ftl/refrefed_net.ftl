<!DOCTYPE html>
<meta charset="utf-8">
<style>
    body {
        overflow:hidden;
        margin:0;
    }

    text {
        font-family: "Helvetica", "sans", "sans-serif";
        pointer-events: none;
    }

    #user{
        color: "gray";
    }

    #rCount{
        color: #d62728;
    }

    #cCount{
        color: #759FB8;
    }

    #coCount{
        color: #ff8914;
    }

</style>
<body>
<script src="/js/time_map/d3.v3.min.js"></script>
<script src="/js/time_map/d3.v4.min.js"></script>
<!-- search input -->
<#--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
<script src="/js/jquery-3.2.1.min.js"></script>
<div class="ui-widget">
    <input id="search" placeholder="search by name">
    <button type="button" id="search_button">查找</button>
    <button type="button" id="clear_button">恢复</button>
    <input type="radio"  name="yin" id="kaiguan" value="0" />&nbsp;引用
    <input type="radio"  name="yin" id="kaiguan" value="1" />&nbsp;被引
    <input type="radio"  name="yin" id="kaiguan" value="2" checked />&nbsp;引用+被引
    <select id="circlesize" style="float:right">
        <option value="total">Total Interactions</option>
        <option value="discussions">Discussions</option>
        <option value="replies">Replies</option>
        <option value="comments">Comments</option>
        <option value="connections">Connections</option>
    </select>

</div>



<div id="graph" style="width: 800px;height: 800px;">
</div>
<script>
    var scholarid = "${scholarId!""}";
</script>
<script src="/js/time_map/ref_refed.js"></script>