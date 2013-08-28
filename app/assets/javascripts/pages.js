$(document).on('click', '.blog-post img, .gallery-box img, .static-box img', function(e) {
  e.preventDefault();
  var image = $(this);
  $('#image-target').html(image);
  $('#image-modal').modal('show');
});