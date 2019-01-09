class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true, foreign_key: 'question_id'

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_passed_test
    correct_questions*100/test.questions.size if completed?
  end

  def current_question_number
    test.questions.size - do_somthink.size
  end

  private

  def correct_answers?(answer_ids)
    current_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def current_answers
    current_question.answers.correct
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    do_somthink.first
  end

  def do_somthink
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
