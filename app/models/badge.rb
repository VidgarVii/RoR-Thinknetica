class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, :image, presence: true
end
