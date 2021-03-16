require 'rails_helper'

RSpec.describe "menu/index.html.erb", type: :view do

  before(:each) do
    assign(:products, [ create(:product, :with_image) ])
  end

  it 'renders each menu item' do
    render
    assert_select "div.card", count: 1
  end

end
