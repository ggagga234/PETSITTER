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
		var send = $(this).parent().parent('.con').children('.send').html();
		console.log(send);
		location.href = "/message/recievedelete?seq="+seq+"&send="+send;
	})
	$(".sedelete").on("click",function(){
		var seq = $(this).attr('id');
		var recieve = $(this).parent().parent('.con').children('.recieve').html();
		location.href = "/message/senddelete?seq="+seq+"&recieve="+ recieve;
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
				if($("#check").html() == "false"){
					alert("받는 사람을 확인해 주시길 바랍니다.");
					return false;
				}
				else{
					return true;
				}
			}
		} 			
	})
	$("#reWrite").on("click",function(){
    	location.href="/message/rewritepage";
    })
    
    $("#msg_reciever").focusout(function() {
		var check = '';
		$.ajax({
			type: "GET",
			url: "/message/checkreciver?reciever="+$("#msg_reciever").val(),
			cache: false,
			dataType : "json",
			success: function(data){
				check = data.re;
				if(check > 0 ){
					$("#check").html("true");
				}
				else{
					$("#check").html("false");
				}		
			}	
		})
	});
    
})