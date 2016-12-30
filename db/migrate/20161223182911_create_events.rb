class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :summary
      t.text :content

      t.timestamps
    end
  end
end
