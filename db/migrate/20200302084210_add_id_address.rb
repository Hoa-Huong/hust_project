class AddIdAddress < ActiveRecord::Migration[6.0]
  def change
    change_table :demands do |t|
      t.references :province, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true
      t.string :address_detail
    end
  end
end
