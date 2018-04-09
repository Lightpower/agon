class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.references :presentation, index: true, foreign_key: true
      t.references :jury, index: true, foreign_key: true
      t.integer :criterion_1
      t.integer :criterion_2
      t.integer :criterion_3
      t.integer :criterion_4
      t.integer :criterion_5

      t.timestamps null: false
    end
  end
end
