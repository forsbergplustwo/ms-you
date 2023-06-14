class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, null: false, foreign_key: true, index: false

      t.timestamps null: false
    end
    add_index :notes, [:user_id, :created_at], name: "index_notes_on_user_id_and_created_at"
  end
end
