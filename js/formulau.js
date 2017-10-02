(function($) {
  "use strict";

  // Smooth scrolling to hashes.
  $('a.smoothscroll').on('click', function(event) {
    if (this.hash !== '') {
      event.preventDefault();

      var hash = this.hash;
      var target = $(this.hash)

      history.pushState(null, null, hash)

      $('html, body').animate({
        scrollTop: target.offset().top
      }, 500, function () {
        target.focus();

        if (target.is(":focus")) {
          return false;
        } else {
          target.attr('tabindex','-1');
          target.focus();
        }
      });
    }

    $('.navbar-collapse').collapse('hide');
  });

  $(window).on('load scroll', function() {
    // Turn the navbar solid when we scroll 15% down.
    if ($('#navbar').offset().top >= $(window).height() * 0.15) {
      $('#navbar').addClass('navbar-solid');
    } else {
      $('#navbar').removeClass('navbar-solid');
    }
  });

})(jQuery);
