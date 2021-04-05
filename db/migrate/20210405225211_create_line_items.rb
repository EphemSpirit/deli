class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :cart_id
    end
    add_index :line_items, :product_id
    add_index :line_items, :cart_id
  end
end
