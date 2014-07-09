// Auto-closing dismissable alerts
$(document).ready (function(){
  		$(".alert-dismissable").fadeTo(2000, 500).slideUp(500, function(){
    			$(".alert-dismissable").alert('close');
		})});

// Text auto-focus on loginModal
$(document).ready (function(){
$('#loginModal').on('shown.bs.modal', function () {
	    $('#username').focus();
			})});

// Text aut3o-focus on new_modal
$(document).ready (function(){
$('#new').on('shown.bs.modal', function () {
	    $('#new_name').focus();
			})});
