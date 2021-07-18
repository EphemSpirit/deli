ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  filter :name
  filter :price
  filter :vegan, as: :check_boxes
  filter :vegetarian, as: :check_boxes
  filter :dairy_free, as: :check_boxes
  filter :nut_free, as: :check_boxes
  filter :available, as: :check_boxes

  permit_params :name, :price, :description, :vegan, :dairy_free, :vegetarian, :nut_free, :available

end
