require 'rails_helper'

RSpec.describe "menu/index.html.erb", type: :view do

  it 'has diet filters displayed' do
    get 'menu/'
    expect(page).to have_content('vegan')
  end
end
