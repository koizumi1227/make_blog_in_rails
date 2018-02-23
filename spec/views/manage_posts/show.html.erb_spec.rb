require 'rails_helper'

RSpec.describe "manage_posts/show", type: :view do
  before(:each) do
    @manage_post = assign(:manage_post, ManagePost.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
