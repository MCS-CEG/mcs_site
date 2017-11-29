
jQuery(document).ready(function(){
	
	$('.registration-form input[type="text"],.registration-form input[type="date"], .registration-form select,.registration-form input[type="password"], .registration-form textarea').each(function() {
		$(this).val( $(this).attr('placeholder') );
    });
	
});