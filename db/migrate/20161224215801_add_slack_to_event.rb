class AddSlackToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :slack, :string
  end
end
