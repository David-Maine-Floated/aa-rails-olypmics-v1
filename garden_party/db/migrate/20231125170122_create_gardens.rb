class CreateGardens < ActiveRecord::Migration[7.0]
  def change
    create_table :gardens do |t|
      t.string :name, null: false
      t.integer :size, null: false   
      t.references :garden_owner, foreign_key: {to_table: :users}, null: false, index: false  
      t.timestamps
    end

      add_index :gardens, [:name, :garden_owner_id], unique: true 
  end
end
