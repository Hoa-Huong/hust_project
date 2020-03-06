class AddIntroduceToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :introduce, :text
  end
end
