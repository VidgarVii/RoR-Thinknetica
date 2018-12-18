class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test'
  has_many :results, dependent: :delete_all
  has_many :tests, through: :results

  def current_test_with_level(level)
    tests.where(level: level)
  end
end
