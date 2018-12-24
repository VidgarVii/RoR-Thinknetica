class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: :uniq_title_with_level }
  validates :level, numericality: { greater_than_or_equal_to: 0,
                                    only_integer: true  }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :all_with_category, -> (category) {
    joins(:category)
      .where(categories: {title: category})
      .order(title: :desc)
    }

    def self.all_with_category_array(category)
      all_with_category(category).pluck(:title)
    end
end
