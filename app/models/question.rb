class Question < ApplicationRecord
  has_many :gists, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :test

  validates :body, presence: true

  def less_body
    body[0..24]
  end
end
