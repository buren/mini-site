$(document).ready(function() {
	$('#site-container').css('min-height', $(window).height()-100);

  $('#toggle-action-buttons').on('click', function(e) {
    e.preventDefault();
    $('.btn').slideToggle(1000);
  });

  $('.post-delete-link-blog').on('click', function() {
    $(this).parents(".blog-post").slideToggle(2000);
  });

  $('.post-delete-link-gallery').on('click', function() {
    $(this).parents(".gallery-box").slideToggle(2000);
  });

  $('.post-delete-link-home').on('click', function() {
    $(this).parents(".row-fluid").slideToggle(2000);
  });

  $('.post-delete-link-static').on('click', function() {
    $(this).parents(".row-fluid").slideToggle(2000);
  });

});
