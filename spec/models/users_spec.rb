require 'rails_helper'

RSpec.describe Users, :type => :model do

  it "is valid with a username, password, and email" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = FactoryGirl.build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a unique email" do
    FactoryGirl.create(:user, email: "prince@denmarkcastle.com")
    user = FactoryGirl.build(:user, email: "prince@denmarkcastle.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

end
