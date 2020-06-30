$(function(){
	$("#write").on("click", function() {
		location.href = "/message/writepage";
	})
	$("#recive").on("click", function() {
		location.href = "/message/recievelist";
	})
	$("#send").on("click", function() {
		location.href = "/message/sendlist";
	})
	$(".redelete").on("click",function(){
		var seq = $(this).attr('id');
		location.href = "/message/recievedelete?seq="+seq;
	})
	$(".sedelete").on("click",function(){
		var seq = $(this).attr('id');
		location.href = "/message/senddelete?seq="+seq;
	})
	$("#case").on("submit",function(){
		if($("#msg_title").val().trim()==""){

			return false;
		}else{
			if($(".note-editable").html().trim()==""){
				alert("내용을 입력해 주시길 바랍니다.");
				return false;
			}
			else{
				return true;
			}
		} 			
	})
	$("#reWrite").on("click",function(){
    	location.href="/message/rewritepage";
    })
})