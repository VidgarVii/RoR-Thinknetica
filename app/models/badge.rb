# frozen_string_literal: true

class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, :description, :badge_type, presence: true
  validates :name, uniqueness: true

  TYPE_BADGES = %w[the_first_time? god? madness? category? passed_tests_of_level?].freeze
end
