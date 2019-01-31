class AddResultToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :score, :integer, default: 0
  end
end
