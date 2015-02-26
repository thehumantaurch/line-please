require 'spec_helper'

describe ScriptsController do
  render_views
  describe "index" do
    before do
      Script.create(title: 'Hamlet', author: "William Shakespeare")
      Script.create(title: 'Hamlet 2', author: "William Shakespeare")
      Script.create(title: 'Neverwhere', author: "Neil Gaiman")
      Script.create(title: 'Very Still & Hard To See', author: 'Steve Yockey')

      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_title
      ->(object) { object["title"] }
    end

    context "when the search finds results" do
      let(:keywords) { 'Ham' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return two results' do
        expect(results.size).to eq(2)
      end
      it "should include 'Hamlet'" do
        expect(results.map(&extract_title)).to include('Hamlet')
      end
      it "should include 'Hamlet 2'" do
        expect(results.map(&extract_title)).to include('Hamlet 2')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end

  end

  describe "show" do
    before do
      xhr :get, :show, format: :json, id: script_id
    end

    subject(:results) { JSON.parse(response.body) }

    context "when the script exists" do
      let(:script) {
        Script.create!(title: 'Living Dead In Denmark',
               author: "Qui Nguyen")
      }
      let(:script_id) { script.id }

      it { expect(response.status).to eq(200) }
      it { expect(results["id"]).to eq(script.id) }
      it { expect(results["title"]).to eq(script.title) }
      it { expect(results["author"]).to eq(script.author) }
    end

    context "when the script doesn't exit" do
      let(:script_id) { -24601 }
      it { expect(response.status).to eq(404) }
    end
  end

  describe "create" do
    before do
      xhr :post, :create, format: :json, script: { title: "She Kills Monsters",
                                           author: "Qui Nguyen" }
    end
    it { expect(response.status).to eq(201) }
    it { expect(Script.last.title).to eq("She Kills Monsters") }
    it { expect(Script.last.author).to eq("Qui Nguyen") }
  end

  describe "update" do
    let(:script) {
      Script.create(title: 'She Kills Monsters',
                     author: "Qui Nguyen")
    }
    before do
      xhr :put, :update, format: :json, id: script.id, script: { title: "Living Dead In Denmark",
                                                 author: "Qui Nguyen" }
      script.reload
    end
    it { expect(response.status).to eq(204) }
    it { expect(script.title).to eq("Living Dead In Denmark") }
    it { expect(script.author).to eq("Qui Nguyen") }
  end

  describe "destroy" do
    let(:script_id) {
      Script.create(title: 'One Flea Spare',
                     author: "Naomi Wallace").id
    }
    before do
      xhr :delete, :destroy, format: :json, id: script_id
    end
    it { expect(response.status).to eq(204) }
    it { expect(Script.find_by_id(script_id)).to be_nil }
  end
end