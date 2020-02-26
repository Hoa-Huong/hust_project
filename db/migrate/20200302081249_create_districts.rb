class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :province_id, null: false, foreign_key: true
    end
  end
end
