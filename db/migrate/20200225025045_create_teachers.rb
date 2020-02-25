class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :graduate
      t.string :address
      t.string :subject
      t.string :time
      t.string :level_study

      t.timestamps
    end
  end
end
