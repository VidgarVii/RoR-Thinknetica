document.addEventListener "turbolinks:load", ->
  startTimer = () ->
    timer = document.getElementById('timer')

    time = timer.innerHTML
    [m, s] = time.split(':')

    if (m <= 0 && s <= 0)
      document.forms[0].submit()
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
