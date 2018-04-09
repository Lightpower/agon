class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :data
      t.references :jury, index: true, foreign_key: true
      t.references :presentation, index: true, foreign_key: true
      t.integer :page

      t.timestamps null: false
    end
  end
end
