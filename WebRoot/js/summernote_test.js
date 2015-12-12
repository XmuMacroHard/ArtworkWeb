/**
 * 
 */

$(document).ready(function()
{			
	$('#summernote').summernote({
		onImageUpload:function(files){
			var $editor = $(this);
			var data = new FormData()
			data.append('fileup', files[0]);
			
			$.ajax({
				url:'ajaxAction',
				method:'POST',
				data:data,
				processData: false,
				contentType: false,
				success: function(data){
					var imgURL = data.url;
					$editor.summernote('insertImage', imgURL);
				}
			})
		}
	});
	
    $('#submit').click(function(){
        var content = $('#summernote').summernote('code');
        alert(content);
    });
});