require 'rails_helper'

RSpec.describe Users, :type => :model do

  it "is valid with a username, password, and email" do
    user = Users.new(
      username: "username",
      password: "password",
      email: "test@example.com")
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = Users.new(
      password: "password",
      email: "test@example.com")
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = Users.new(
      username: "username",
      email: "test@example.com")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = Users.new(
      username: "username",
      password: "password")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a unique email" do
    Users.create(
      username: "username",
      password: "password",
      email: "test@example.com",
      first_name: "Test",
      last_name: "Example")
    user2 = Users.new(
      username: "username2",
      password: "password2",
      email: "test@example.com")
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

end
