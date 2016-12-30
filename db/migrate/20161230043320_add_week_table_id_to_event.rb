class AddWeekTableIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :week_table_id, :integer
  end
end
