class ChnageFlowers < ActiveRecord::Migration[7.0]
  def change
    rename_column :flowers, :gardener_id_id, :gardener_id
    rename_column :flowers, :garden_id_id, :garden_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
