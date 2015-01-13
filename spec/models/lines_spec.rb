require 'rails_helper'

describe Lines do

  it "is valid with a character id" do
    line = Lines.new(character_id: 1)
    expect(line).to be_valid
  end

  it "is invalid without a chracter id" do
    line = Lines.new(character_id: nil)
    line.valid?
    expect(line.errors[:character_id]).to include("can't be blank")
  end

end