require 'rails_helper'

RSpec.describe Region, type: :model do
  it {should validate_presence_of :name}
  it {should have_one :location}

  let(:valid_params){
    {
      name: "Test"
    }
  }

  it "should return true if valid? params are given" do
    expect(Region.new(**valid_params).valid?).to be true
  end

  it "should return false if empty name is given" do
    expect(Region.new({}).valid?).to be false
  end
end
