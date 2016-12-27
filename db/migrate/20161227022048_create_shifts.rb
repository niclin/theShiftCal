class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :slack, foreign_key: true

      t.timestamps
    end
  end
end
