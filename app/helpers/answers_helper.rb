module AnswersHelper
  def correct_answer_tag(correct)
    correct ? content_tag(:i, '', class: 'fa fa-check-square green') : ''
  end
end
