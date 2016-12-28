class CreateIcals < ActiveRecord::Migration[5.0]
  def change
    create_table :icals do |t|

      t.timestamps
    end
  end
end
