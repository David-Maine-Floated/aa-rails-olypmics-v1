class ChangeGardensAgain < ActiveRecord::Migration[7.0]
  def change
    remove_index :gardens, name: 'garden_owner_id'
    add_index :gardens, [:garden_owner_id, :name], name: "garden_owner_id", unique: true 
    #Ex:- add_index("admin_users", "username")
  end
end
