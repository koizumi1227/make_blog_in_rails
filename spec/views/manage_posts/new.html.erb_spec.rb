require 'rails_helper'

RSpec.describe "manage_posts/new", type: :view do
  before(:each) do
    assign(:manage_post, ManagePost.new())
  end

  it "renders new manage_post form" do
    render

    assert_select "form[action=?][method=?]", manage_posts_path, "post" do
    end
  end
end
