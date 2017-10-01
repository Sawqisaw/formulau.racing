(function($) {
  "use strict";

  $('a.js-scroll-trigger').click(function(event) {
    if (this.hash !== "") {
      event.preventDefault();

      var hash = this.hash;
      window.scroll({
        top: $(hash).offset().top,
        left: 0,
        behavior: 'smooth'
      });

      window.location.hash = hash;
    }

    $('.navbar-collapse').collapse('hide');
  });

  $(window).scroll(function() {
    if ($("#navbar").offset().top > 100) {
      $("#navbar").addClass("navbar-shrink");
    } else {
      $("#navbar").removeClass("navbar-shrink");
    }
  });

})(jQuery);
