require 'spec_helper'

describe "Notes" do
  describe "GET /notes/:id/rendering" do
    let!(:note) { FactoryGirl.create(:note) }

    it "should return success" do
      post rendering_notes_path, format: :json, raw_body: note.raw_body
      expect(response.status).to be(200)
    end

    it "should return note json" do
      post rendering_notes_path, format: :json, raw_body: note.raw_body
      res = ActiveSupport::JSON.decode(response.body)
      expect(res).to be_a(Hash)
      expect(res['body']).to eq(note.render_markdown)
    end
  end
end
