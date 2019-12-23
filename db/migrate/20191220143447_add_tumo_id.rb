class AddTumoId < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tumoid, :integer
  end
end
