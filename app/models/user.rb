class User < ApplicationRecord
  has_many :tests
  has_many :results
  has_many :tests, through: :results

  def current_test_with_level(level)
    tests.where(level: level)
  end
end
