class Test < ApplicationRecord
  def self.all_with_category(category)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id")
        .where("categories.title = :name", name: category)
        .order(title: :desc)
        .pluck(:title)
  end
end
