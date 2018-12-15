class Test < ApplicationRecord
  def self.all_with_category(category)
    category_id = Category.where("title = :category", category: category)[0].id
    Test.where(category_id: category_id).order('title')
  end
end
