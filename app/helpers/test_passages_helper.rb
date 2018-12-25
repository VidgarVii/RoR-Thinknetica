module TestPassagesHelper

  def result_test(correct_questions, total_count_questions)
    result = correct_questions*100/total_count_questions

    return "<span style='color:#4caf50'>Результат #{result}% правильных ответов.
             Тест пройден</span>".html_safe if result >= 85
    return "<span style='color:#f00'>Результат #{result}% правильных ответов.
             Тест не пройден</span>".html_safe if result < 85
  end
end
