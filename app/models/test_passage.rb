class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  private

  def correct_answers?(answer_ids)
    count_answers = current_answers.size
    count_answers == current_answers.where(id: answer_ids).size && count_answers == answer_ids.size
  end

  def current_answers
    current_question.answers.true_answers
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
