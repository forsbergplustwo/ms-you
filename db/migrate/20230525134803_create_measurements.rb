class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.references :symptom, null: false, foreign_key: true, index: false
      t.text :description
      t.integer :severity

      t.timestamps null: false
    end
    add_index :measurements, [:symptom_id, :created_at], unique: true
  end
end
