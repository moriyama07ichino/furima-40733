class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :days_to_ship_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
