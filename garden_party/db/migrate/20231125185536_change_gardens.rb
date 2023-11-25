class ChangeGardens < ActiveRecord::Migration[7.0]
  def change
    remove_index :gardens, name: 'index_gardens_on_name_and_garden_owner_id'
    add_index :gardens, [:name, :garden_owner_id], name: "garden_owner_id", unique: true 

  end
end
