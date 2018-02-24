require 'rails_helper'

RSpec.describe "ManagePosts", type: :request do
  describe "GET /manage_posts" do
    it "works! (now write some real specs)" do
      get manage_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
