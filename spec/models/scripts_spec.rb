require 'rails_helper'

describe Script do
  it "is valid with a title and author" do
    script = Script.new(
      author: 'William Shakespeare',
      title: 'Hamlet')
    expect(script).to be_valid
  end
  it "is invalid without an author" do
    script = Script.new(author: nil)
    script.valid?
    expect(script.errors[:author]).to include("can't be blank")
  end
  it "is invalid without a title" do
    script = Script.new(title: nil)
    script.valid?
    expect(script.errors[:title]).to include("can't be blank")
  end

end