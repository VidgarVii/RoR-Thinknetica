class CreateBadgesAndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :badges_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :badge, index: true
    end
  end
end
