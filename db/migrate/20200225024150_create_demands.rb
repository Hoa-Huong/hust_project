class CreateDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :demands do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.integer :number_student
      t.string :level_class
      t.float :time_per_session
      t.integer :fee
      t.integer :status, default: 0
      t.integer :status_teach, default: 0

      t.timestamps
    end
  end
end
