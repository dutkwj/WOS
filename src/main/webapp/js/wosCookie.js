/**
 * Created by liyunhao on 18-7-28.
 */
if($.cookie('scholars')==null){
    var scholars = [];
    $.cookie('scholars', JSON.stringify(scholars), { path: '/', expires: 7 });
}
dispHtml();

function dispHtml() {
    var scholars = JSON.parse($.cookie('scholars'));
    $('#RcentVisited').html("");
    scholars.forEach(function (item,index) {
        //console.log("index :" + index + JSON.stringify(item));
        var temp = "li:eq("+index+")";
        var url = '/relationGraph/'+item.id+'/MVC';

//            <a href="dsfasd"></a>
        var list = '<li><a href="'+ url+ ' " >' + item.name + '</a> </li>';
        //console.log(list);
        $('#RcentVisited').append(list);
    });
}
function addRecentVisit(scholarId,scholarName) {
    var sc = {};
    sc.id = scholarId;
    sc.name = scholarName;

    dispHtml();

    var scholars = JSON.parse($.cookie('scholars'));
    if(isInIt(sc)){
        console.log("is in it");
        dispHtml();
        return;
    }else if(scholars.length<5){
        scholars.push(sc);
    }else if(scholars.length==5){
        scholars.splice(0,1);
        scholars.push(sc);

    }

    dispHtml();

    $.cookie('scholars', JSON.stringify(scholars), { path: '/', expires: 7 });

}
function isInIt(scholar){
    var scholars = JSON.parse($.cookie('scholars'));
    for(var i=0;i<scholars.length;i++){
        if(scholars[i].id == scholar.id){
            return true;
        }
    }
    return false;
}