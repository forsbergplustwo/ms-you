class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.references :symptom, null: false, foreign_key: true
      t.integer :severity

      t.timestamps
    end
  end
end
