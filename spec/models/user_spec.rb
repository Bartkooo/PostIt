require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) {
    User.new(first_name: "model", last_name:"testing", email:'model@g.com', password:'model123')
  }

  let(:user2) {
    User.new(first_name: "test", last_name:"testing", email:'test@g.com', password:'test123')
  }

  it "does not create user without valid values" do
    expect(User.new).to_not be_valid
  end

  it "does create valid user" do
    expect(user1).to be_valid
  end

  it "sends invitation" do
    user1.save
    user2.save
    expect{ user1.send_invitation(user2) }.to change{ Invitation.count }.by(1)
  end

  it "check if users are friends" do
    expect(user1.friend_with?(user2)).to be(false)
  end
end
