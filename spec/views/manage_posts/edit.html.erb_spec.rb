require 'rails_helper'

RSpec.describe "manage_posts/edit", type: :view do
  before(:each) do
    @manage_post = assign(:manage_post, ManagePost.create!())
  end

  it "renders the edit manage_post form" do
    render

    assert_select "form[action=?][method=?]", manage_post_path(@manage_post), "post" do
    end
  end
end
