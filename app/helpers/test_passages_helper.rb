module TestPassagesHelper
  def result_test(test_passage)
    if test_passage.success?
      content_tag(:span,
                  t('result_test_true', count: test_passage.result),
                  class: 'success')
    else
      content_tag(:span,
                  t('result_test_false', count: test_passage.result),
                  class: 'fail')
    end
  end

  def progresbar(current_question, count_question)
    current_question * 100 / count_question
  end

  def time_left(time)
    return unless time

    time = time.round
    sec = time % 60
    min = time / 60
    content_tag :span, "#{min}:#{sec}", id: 'timer'
  end
end
