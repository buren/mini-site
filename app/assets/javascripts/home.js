var ready;

ready = function() {
	$('#site-container').css('min-height', $(window).height()-100);
};

$(document).ready(ready);
$(document).on('page:load', ready);
