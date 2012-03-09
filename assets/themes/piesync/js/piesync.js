---
---

    $(function() {
      $("#title").mouseover(function() { $("#arrow").css('display','inline') });
      $("#title").mouseout(function() { $("#arrow").hide() });
      $(".more-info").mouseover(function() {
        var div = $("#" + $(this).attr("data-hover-target"));
        var q = $(this);
        var poster = $("#inner_poster").offset();
        div.css({
          top: q.offset().top - q.height() - poster.top,
          left: q.offset().left - div.width() - q.width() - poster.left - 20
        });
        div.show();
      })
      $(".more-info").mouseout(function() {
        $("#" + $(this).attr("data-hover-target")).hide();
      });
      $(".beta input[type='submit']").click(function() {
        if (!$("#beta-email").val().match("^.*@.*\.[a-zA-Z]{2,3}$")) {
          // _gaq.push(['_trackEvent', 'beta', 'email_fail']);
          alert("We could not correctly interpret your email. If you believe this is incorrect, please send us a mail using the feedback button on the right.");
          $("#beta-email").focus();
          return false;
        }
        // _gaq.push(['_trackEvent', 'beta', 'email_add']);
        $(this).attr("value","requesting access...");
        $(this).attr("disabled","disabled");

        $.ajax({
          url: "http://highrisesync-promo.herokuapp.com/mail",
          data: { email: $("#beta-email").val() },
          dataType: "jsonp",
          success: function(data, textStatus, jqXHR) {
            $("#beta-cta").hide();
            $("#feedback").css('display','inline-block');
          }
        });
        return false;
      });
      // prefetching css hover images, better sprited..
      var images = [];
      $.each(images, function(i) {
        var im = new Image();
        im.src = images[i];
      });
    });