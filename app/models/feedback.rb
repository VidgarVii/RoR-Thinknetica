class Feedback < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, :body, presence: true
end
