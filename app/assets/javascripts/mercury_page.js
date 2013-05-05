$(window).on('mercury:ready', function() {
  Mercury.on('saved', function() {
		window.location = window.location.href.replace(/\/editor\//i, '/');
  });
});