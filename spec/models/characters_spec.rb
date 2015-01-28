require 'rails_helper'

describe Character do

  it "is valid with a script_id" do
    character = Character.new(script_id: 1)
    expect(character).to be_valid
  end

  it "is invalid without a script_id" do
    character = Character.new(script_id: nil)
    character.valid?
    expect(character.errors[:script_id]).to include("can't be blank")
  end

end