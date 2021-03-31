class AddIndecesToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_index :line_items, :product_id
    add_index :line_items, :cart_id
  end
end
