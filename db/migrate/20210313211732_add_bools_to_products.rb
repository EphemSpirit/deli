class AddBoolsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :vegan, :boolean, default: false
    add_column :products, :dairy_free, :boolean, default: false
    add_column :products, :vegetarian, :boolean, default: false
    add_column :products, :nut_free, :boolean, default: false
    add_column :products, :available, :boolean, default: true
  end
end
