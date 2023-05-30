class AddAdditionalFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :preferred_language, :string, default: "English"
    add_column :symptoms, :user_id, :integer, null: false, index: true

    add_index :measurements, [:symptom_id, :measured_at], unique: true
  end
end
