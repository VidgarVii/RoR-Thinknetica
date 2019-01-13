class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test'
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true
  validates :email, uniqueness: true,
                    format: /.+@.+\..+/i

  has_secure_password

  def current_test_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
