class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.float :point

      t.timestamps
    end
  end
end
