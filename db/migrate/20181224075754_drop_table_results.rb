class DropTableResults < ActiveRecord::Migration[5.2]
  def up
    drop_table :results, if_exists: true
  end
end
