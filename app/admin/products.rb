ActiveAdmin.register Product do

  #index view
  config.per_page = 15

  index do
    selectable_column
    column :name
    column :description
    column :nut_free
    column :dairy_free
    column :vegetarian
    column :vegan
    column :available
    actions defaults: false do |product|
      item "Preview", admin_product_path(product), class: "member_link"
      item "Update", edit_admin_product_path(product), class: "member_link"
      item "Delete", admin_product_path(product), class: "member_link"
    end
  end

  filter :name
  filter :price
  filter :vegan, as: :check_boxes
  filter :vegetarian, as: :check_boxes
  filter :dairy_free, as: :check_boxes
  filter :nut_free, as: :check_boxes
  filter :available, as: :check_boxes

  sidebar :help do
    ul do
      li "For help, please reach out to help@hundessohndeli.com"
    end
  end

  #show

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :available
      row :nut_free
      row :dairy_free
      row :vegetarian
      row :vegan
    end
    active_admin_comments
  end

  permit_params :name, :price, :description, :vegan, :dairy_free, :vegetarian, :nut_free, :available

end
