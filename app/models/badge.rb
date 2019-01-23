class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, :description, presence: true
end
