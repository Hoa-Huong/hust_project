class CreateTeachOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :teach_offers do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :demand, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
