class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :lesson_name
      t.string :date
      t.string :note_entry
      t.integer :user_id

      t.timestamps
    end
  end
end
