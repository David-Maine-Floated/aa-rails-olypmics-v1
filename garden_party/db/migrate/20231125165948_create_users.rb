class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true 

      t.timestamps
    end
  end
end



# add_index :gardens, [:name, :garden_owner_id], unique: true
