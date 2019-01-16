document.addEventListener "turbolinks:load", ->
  navlinks = document.getElementsByClassName('nav-link')

  add_active_to_link = (link) ->
    if link.href == location.href
      link.classList.add('active')

  add_active_to_link(link) for link in navlinks
