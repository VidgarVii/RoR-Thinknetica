class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  belongs_to :authored_tests, class_name: 'User', foreign_key: 'user_id'
  validates :title, presence: true,
                    uniqueness: { scope: :level, message: :uniq_title_with_level }
  validates :level, numericality: { greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :all_with_category, -> (category) {
    joins(:category)
      .where(categories: {title: category})
      .order(title: :desc)
      .pluck(:title)
    }
end
