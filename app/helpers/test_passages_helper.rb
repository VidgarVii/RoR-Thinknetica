module TestPassagesHelper

  def result_test(result)
    if result >= 85
      content_tag(:span, "Тест пройден. Результат #{result}% правильных ответов", class: 'success')
    else
      content_tag(:span, "Тест не пройден. Результат #{result}% правильных ответов.", class: 'fail')
    end
  end
end
