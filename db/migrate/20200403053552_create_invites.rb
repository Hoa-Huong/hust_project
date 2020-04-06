class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
