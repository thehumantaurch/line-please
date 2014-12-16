require 'rails_helper'

describe Scenes do
  it "is valid with a script_id" do
    scene = Scenes.new(script_id: 1)
    expect(scene).to be_valid
  end

  it "is invalid without a script_id" do
    scene = Scenes.new(script_id: nil)
    scene.valid?
    expect(scene.errors[:script_id]).to include("can't be blank")
  end
end