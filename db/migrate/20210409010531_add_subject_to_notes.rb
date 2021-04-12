class AddSubjectToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :subject_id, :integer
  end
end
