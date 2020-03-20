class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.string :description
      t.string :creator
      t.integer :rank

      t.timestamps null: false
    end
  end
end
