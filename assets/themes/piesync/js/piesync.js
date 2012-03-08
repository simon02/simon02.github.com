
    $(function() {
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
      $("#submit").click(function() {
        if (!$("#email").val().match("^.*@.*\.[a-zA-Z]{2,3}$")) {
          _gaq.push(['_trackEvent', 'beta', 'email_fail']);
          alert("We could not correctly interpret your email. If you believe this is incorrect, please send us a mail using the feedback button on the right.");
          $("#email").focus();
          return false;
        }
        _gaq.push(['_trackEvent', 'beta', 'email_add']);
        $("#submit").attr("value","requesting beta access...");
        $("#submit").attr("disabled","disabled");

        $.ajax({
          url: "http://highrisesync-promo.herokuapp.com/mail",
          data: { email: $("#email").val() },
          dataType: "jsonp",
          success: function(data, textStatus, jqXHR) {
            $("#cta").hide();
            $("#feedback").show();
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