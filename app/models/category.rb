class Category < ApplicationRecord
  default_scope { order(:title) }
  has_many :tests, dependent: :nullify
  validates :title, presence: true
end
