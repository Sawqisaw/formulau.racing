(function($) {
  "use strict";

  // Smooth scrolling to hashes.
  $('a.smoothscroll').on("click", function(event) {
    if (this.hash !== "") {
      event.preventDefault();

      window.scroll({
        top: $(this.hash).offset().top,
        left: 0,
        behavior: 'smooth'
      });

      history.pushState(null, null, this.hash)
    }

    $('.navbar-collapse').collapse('hide');
  });

  // Shrink the navbar when we scroll 15% down.
  $(window).on("load scroll", function() {
    if ($("#navbar").offset().top > $(window).height() * 0.15) {
      $("#navbar").addClass("navbar-shrink");
    } else {
      $("#navbar").removeClass("navbar-shrink");
    }
  });

})(jQuery);
