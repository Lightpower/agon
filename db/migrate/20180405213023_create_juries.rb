class CreateJuries < ActiveRecord::Migration
  def change
    create_table :juries do |t|
      t.string :name, null: false
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
