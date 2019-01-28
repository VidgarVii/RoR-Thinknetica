class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :image
      t.string :badge_type, null: false
      t.string :option

      t.timestamps
    end
  end
end
