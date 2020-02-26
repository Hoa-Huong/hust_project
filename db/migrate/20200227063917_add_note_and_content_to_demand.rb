class AddNoteAndContentToDemand < ActiveRecord::Migration[6.0]
  def change
    add_column :demands, :note, :text
    add_column :demands, :title, :string
  end
end
