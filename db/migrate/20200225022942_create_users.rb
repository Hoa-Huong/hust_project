class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birth
      t.string :email
      t.string :phone
      t.integer :role

      t.timestamps
    end
  end
end
