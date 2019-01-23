class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :badge_type


      t.timestamps
    end
  end
end
