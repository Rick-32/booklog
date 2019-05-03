$(document).on('turbolinks:load', function() {
  $(".dropdown-trigger").on("click", function() {
		$(this).next().toggle();
		$(this).toggleClass("active");
	});

	$(document).on('click', function(e) {
		if (!$(e.target).closest('.dropdown-trigger').length) {
			$('.dropdown').hide();
		}
	});
});

