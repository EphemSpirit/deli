require 'rails_helper'

RSpec.describe LineItem, type: :model do

  let(:line_item) { create(:line_item) }

  it 'is valid' do
    expect(line_item).to be_valid
  end
end
