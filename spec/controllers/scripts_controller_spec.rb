require 'spec_helper'

describe ScriptsController do
  render_views
  describe "index" do
    before do
      Script.create!(title: 'Hamlet', author: "William Shakespeare")
      Script.create!(title: 'Neverwhere', author: "Neil Gaiman")
      Script.create!(title: 'Very Still & Hard To See', author: "Steve Yockey")
      Script.create!(title: 'As You Like It', author: "William Shakespeare")

      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_title
      ->(object) { object["title"] }
    end

    context "when the search finds results" do
      let(:keywords) { 'hamlet' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return one result' do
        expect(results.size).to eq(1)
      end
      it "should include 'Hamlet'" do
        expect(results.map(&extract_title)).to include('Hamlet')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end

  end
end