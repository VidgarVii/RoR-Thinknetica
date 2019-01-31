class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true, foreign_key: 'question_id'

  PASSING_SCORE = 85

  before_validation :before_validation_set_first_question, on: :create

  scope :successful, -> { where('score >= ?', PASSING_SCORE) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil? || times_up?
  end

  def success?
    score >= PASSING_SCORE
  end

  def result
    correct_questions * 100.0 / test.questions.size if completed?
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def cache_result
    update!(score: result)
  end

  def times_up?
    test.timer.nil? ? false : times_up <= Time.current
  end

  def left_time
    return false if test.timer.nil?

    time = times_up - Time.current
    time.positive? ? time : 0
  end

  private

  def times_up
    created_at + test.timer.minutes
  end

  def correct_answers?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
