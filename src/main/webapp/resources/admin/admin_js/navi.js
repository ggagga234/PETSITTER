$(function(){

    $("#hide").on("click",function(){
        $("#lside").removeClass("d-sm-block");
        $("#view").addClass("d-sm-block");
    });
    $("#view").on("click",function(){
        $("#view").removeClass("d-sm-block");
        $("#lside").addClass("d-sm-block");
    })

    $("#navmenuon").on("click",function(){
        $("#navmenu").slideDown(1000);
        $("#navmenuon").css('display','none');  
        $("#navmenuoff").css('display','block');
    })

    $("#navmenuoff").on("click",function(){
        $("#navmenu").slideUp(1000);
        $("#navmenuoff").css('display','none');
        $("#navmenuon").css('display','block');  
    })

    var windowWidth = $(window).width();
    if(windowWidth < 560) {
        $("#nav").css('display','block');
    } else {
        $("#nav").css('display','none');
    }

    $(window).resize(function() {
        windowWidth = $( window ).width();
        if(windowWidth < 560) {
            $("#nav").css('display','block');
        } else {
            $("#navmenuoff").css('display','none');
            $("#navmenuon").css('display','block');  
            $("#nav").css('display','none');
            $("#navmenu").css('display','none');
        }
    });
});