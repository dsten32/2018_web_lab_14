// http://stackoverflow.com/questions/5614399/disabling-submit-button-until-all-fields-have-values
// and http://jsfiddle.net/qKG5F/2368/
$(function() { // same as $(document).ready(function);
	$("#submit_id").attr('disabled','disabled');
	$("#caption_id").keyup(function() {
		if($(this).val().trim() !== ''){
			$("#submit_id").removeAttr('disabled');			
		}
		else {
			$('#submit_id').attr('disabled', 'disabled');
		} 
	 });
});
