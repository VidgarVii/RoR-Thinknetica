module TestPassagesHelper

  def result_test(test_passage)
    if test_passage.success?
      content_tag(:span, "Тест пройден. Результат #{test_passage.result}% правильных ответов", class: 'success')
    else
      content_tag(:span, "Тест не пройден. Результат #{test_passage.result}% правильных ответов.", class: 'fail')
    end
  end
end
