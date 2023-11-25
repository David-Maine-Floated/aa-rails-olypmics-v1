class CreateFlower < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers do |t|
      t.string :flower_type, null: false   
      t.references :gardener_id, foreign_key: {to_table: :users}, index: true 
      t.references :garden_id, foreign_key: {to_table: :gardens}, index: true 

      t.timestamps
    end
  end
end
