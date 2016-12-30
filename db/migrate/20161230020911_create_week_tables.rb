class CreateWeekTables < ActiveRecord::Migration[5.0]
  def change
    create_table :week_tables do |t|

      t.timestamps
    end
  end
end
