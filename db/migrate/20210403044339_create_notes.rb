class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :subject
      t.string :date
      t.string :note_entry

      t.timestamps
    end
  end
end
