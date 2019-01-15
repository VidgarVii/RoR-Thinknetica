class Category < ApplicationRecord
  default_scope { order(:title) }
  has_many :tests, dependent: :nullify
  validates :title, presence: true

  def translated_title
    I18n.t(title, scope: 'categories')
  end
end
