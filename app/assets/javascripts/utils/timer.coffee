document.addEventListener "turbolinks:load", ->
  startTimer = () ->
    resultLink = window.location.href + '/result'
    timer = document.getElementById('timer')
    unless timer then return

    time = timer.innerHTML
    array = time.split(':')
    m = array[0]
    s = array[1]

    if (m <= 0 && s <= 0)
      window.location.replace(resultLink)
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
