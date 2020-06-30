$(function(){
	$(document).ready(function() {
		$('#summernote').summernote();
	});
	$('#summernote').summernote({
		height: 360,  
		disableResizeEditor: true,
		placeholder : '본문을 적어주시길 바랍니다.', 
		toolbar: [
			['style', ['bold', 'italic', 'underline', 'clear']],
			['font', ['strikethrough']],
			['fontsize', ['fontsize']],
			['color', ['color']],
			['para', ['ul','ol', 'paragraph']],
			['height', ['height']],
			['insert', ['picture']]
			],
			callbacks: { // 콜백을 사용
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i],this);
					}
				}
			}
	});
	function sendFile(file, editor) {
		// 파일 전송을 위한 폼생성
		data = new FormData();
		data.append("uploadFile", file);
		$.ajax({ // ajax를 통해 파일 업로드 처리
			data : data,
			type : "POST",
			url : "/message/summerimage",
			cache : false,
			contentType : false,
			enctype: 'multipart/form-data',
			dataType : "json",
			processData : false,
			success : function(data) { // 처리가 성공할 경우
				$(editor).summernote('editor.insertImage',data.url);
			}
		});
	}
})