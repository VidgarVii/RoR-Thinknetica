class AddResultToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :result, :integer
  end
end
