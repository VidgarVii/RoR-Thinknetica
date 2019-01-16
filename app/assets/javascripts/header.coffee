document.addEventListener "turbolinks:load", ->
  navlinks = document.getElementsByClassName('nav-link')

  addActiveToLink = (link) ->
    if link.href == location.href
      link.classList.add('active')

  addActiveToLink(link) for link in navlinks
