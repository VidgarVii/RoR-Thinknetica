module QuestionsHelper
  HEADER = {new: 'Создать вопрос для теста',
            edit: 'Редактировать вопрос для теста'}.freeze

  def question_header(object)
    object.new_record? ? "#{HEADER[:new]} #{@test.title}": "#{HEADER[:edit]} #{object.test.title}"
  end
end
