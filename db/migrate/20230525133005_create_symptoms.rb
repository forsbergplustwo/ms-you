class CreateSymptoms < ActiveRecord::Migration[7.0]
  def change
    create_table :symptoms do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.integer :severity

      t.timestamps
    end
  end
end
