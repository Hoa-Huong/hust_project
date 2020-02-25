class CreateAddressDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :address_demands do |t|
      t.references :demand, null: false, foreign_key: true
      t.string :province
      t.string :district
      t.string :commune
      t.string :addr_detail

      t.timestamps
    end
  end
end
