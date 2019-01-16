document.addEventListener "turbolinks:load", ->
  navlink = document.getElementsByClassName('nav-link')

  log = (link) ->
    if link.href == location.href
      link.classList.add('active')

  log link for link in navlink
