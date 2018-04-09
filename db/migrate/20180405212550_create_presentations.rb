class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name, null: false
      t.string :path
      t.string :authors
      t.references :location, index: true, foreign_key: true
      t.integer :number
      t.integer :page, default: 0
      t.boolean :is_active, default: false

      t.timestamps null: false
    end
  end
end
