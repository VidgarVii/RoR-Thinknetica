class Test < ApplicationRecord
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  belongs_to :user

  def self.all_with_category(category)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
        .where(categories: {title: category})
        .order(title: :desc)
        .pluck(:title)
  end
end
