document.addEventListener "turbolinks:load", ->

  # Добавляем сортировку в теблице Тесты по названию

  testNamesColumn = document.getElementById('nameTest')

  setArrow = (arrow, direct) ->
    arrow.className = if (direct < 0) then 'fa fa-sort-asc' else 'fa fa-sort-desc'

  sortTable = (direction) ->
    tbody = document.getElementsByTagName('tbody')[0]
    trs = tbody.rows
    trList = [].slice.call(trs)

    trList.sort((a,b) ->
      nameA =  a.children[0].innerText
      nameB =  b.children[0].innerText

      if (nameA < nameB) then return -1*direction
      if (nameA > nameB) then return 1*direction
    )

    trList.forEach((tr) ->
      tbody.append(tr)
    )

  if testNamesColumn
    arrow = testNamesColumn.children[0]
    direct = 1
    testNamesColumn.addEventListener 'click', () ->
      direct *= -1
      sortTable(direct)
      setArrow(arrow, direct)
