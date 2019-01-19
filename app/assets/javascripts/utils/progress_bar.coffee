document.addEventListener "turbolinks:load", ->
  progressBar = document.getElementById('progressBar')

  progress = () ->
    block = progressBar.children[0]
    progressValue = Number.parseInt(progressBar.dataset.progress)
    block.style.width = "#{progressValue}%"

  if progressBar then progress()
