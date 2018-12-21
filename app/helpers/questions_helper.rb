module QuestionsHelper
  HEADER = {'new' => 'Создать вопрос для теста',
            'edit' => 'Редактировать вопрос для теста'}.freeze

  def question_header(test_name)
    "#{HEADER[action_name]} #{test_name}"
  end
end
