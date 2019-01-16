document.addEventListener "turbolinks:load", ->
  $(".navbar-nav .nav-item").on "click", () ->
    $(".navbar-nav").find(".active").removeClass("active")
    $(this).addClass("active")

