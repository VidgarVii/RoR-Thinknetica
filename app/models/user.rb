class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :authored_tests, class_name: 'Test'
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy
  has_many :feedbacks, dependent: :delete_all
  has_many :badges, dependent: :destroy

  def admin?
    is_a?(Admin)
  end

  def current_test_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
