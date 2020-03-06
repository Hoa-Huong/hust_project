class AddProvinceAndDistrictToTeacher < ActiveRecord::Migration[6.0]
  def change
    change_table :teachers do |t|
      t.references :province, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true
    end
  end
end
