document.addEventListener "turbolinks:load", ->
  startTimer = () ->
    timer = document.getElementById('timer')
    unless timer then return

    time = timer.innerHTML
    array = time.split(':')
    m = array[0]
    s = array[1]

    if (s == '00' && m == '00')
      window.location.reload()
      return

    if (m < 10) then m = "0" + m

    if (s == '00')
      s = 59
      m--
    else
      s--

    if (s < 10) then s = "0" + s

    timer.innerHTML = "#{m}:#{s}"
    setTimeout(startTimer, 1000)

  if document.getElementById('timer') then startTimer()
