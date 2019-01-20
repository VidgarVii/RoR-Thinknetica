document.addEventListener "turbolinks:load", ->

  btnsEdit = document.getElementsByClassName('edit')

  getEventClick = (btn) ->
    btn.addEventListener 'click', ->
      testInlineEdit(this)

  if (btnsEdit) then getEventClick(btn) for btn in btnsEdit

  testInlineEdit = (btn) ->
    form = document.querySelectorAll("form[data-test-id='#{btn.dataset.testId}']")
    if btn.dataset.state == 'true'
      form[0].style.display = 'none'
      btn.dataset.state = 'false'
      btn.textContent = 'Изменить'
    else
      form[0].style.display = 'block'
      btn.dataset.state = 'true'
      btn.textContent = 'Отмена'
