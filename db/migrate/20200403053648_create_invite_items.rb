class CreateInviteItems < ActiveRecord::Migration[6.0]
  def change
    create_table :invite_items do |t|
      t.references :demand, null: false, foreign_key: true
      t.references :invite, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
