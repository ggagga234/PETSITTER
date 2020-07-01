$(function(){
	$("#checkAll").on("click",function(){
		if($("#checkAll").prop("checked")){ $("input[name='service']").prop("checked",true);
		} else {
			$("input[name='service']").prop("checked",false);
		}
	});
	var mpet = [];
	$(".petname").on("click",function(){
		var img = $(this).data("imgsrc");
		if($(".petname").prop("checked") == true){ 
				$(".petselec").html('<img src="/resources/images/'+img+'"/>');
		}else{ 
			$(".petselec").html("<img src='/resources/images/mypet.jpg'/>");
			
		}
	})
		
})



