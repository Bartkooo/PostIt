require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) {
    User.new(first_name: "test", last_name:"testing", email:'test@g.com', password:'test123')
  }

  it "does not create user without valid values" do
    expect(User.new).to_not be_valid
  end

  it "does create valid user" do
    expect(user1).to be_valid
  end
end
