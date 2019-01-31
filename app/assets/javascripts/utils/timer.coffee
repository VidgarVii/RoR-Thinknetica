document.addEventListener "turbolinks:load", ->
  startTimer = () ->
    timer = document.getElementById('timer')
    unless timer then return

    resultLink = window.location.href + '/result'

    time = timer.innerHTML
    [m, s] = time.split(':')

    if (m <= 0 && s <= 0)
      window.location.replace(resultLink)
#      window.location.reload()
      return

    if (s == '0' || s == '00')
      s = 59
      m--
    else
      s--

    if (s < 10) then s = "0" + s

    timer.innerHTML = "#{m}:#{s}"
    setTimeout(startTimer, 1000)

  if document.getElementById('timer') then startTimer()
