// $(document).on('click', '.blog-post img, .static-box img', function(e) {
//   e.preventDefault();
//   var image = $(this);
//   $('#image-target').html(image.clone());
//   $('#image-modal').modal('show');
// });

$(document).on('click', '.gallery-box img, .blog-post img, .static-box img', function(e) {
  e.preventDefault();
  image = $(this);
  imageLink = image.parent('.fancybox').attr('href', image.attr('src'));
  $('.fancybox').fancybox({
    padding: 0,
    helpers : {
      thumbs  : {
        width : 50,
        height  : 50
      }
    }
  });
  imageLink.click();
  postId = imageLink.attr('data-post-id');
});
