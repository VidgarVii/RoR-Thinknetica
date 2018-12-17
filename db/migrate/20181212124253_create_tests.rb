class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.text :title, null: false
      t.integer :level, default: 0
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
