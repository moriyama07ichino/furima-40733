class DropProducts < ActiveRecord::Migration[6.0]
  def up
    drop_table :products
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end