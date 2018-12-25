class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
    self.question = next_question
    save!
  end

  def completed?
    question.nil?
  end

  private

  def correct_answers?(answer_ids)
    current_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def current_answers
    question.answers.true_answers
  end

  def before_validation_set_first_question
    self.question = test.questions.first if test.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', question.id).first
  end
end
