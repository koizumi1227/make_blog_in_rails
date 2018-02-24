require 'rails_helper'

RSpec.describe "manage_posts/index", type: :view do
  before(:each) do
    assign(:manage_posts, [
      ManagePost.create!(),
      ManagePost.create!()
    ])
  end

  it "renders a list of manage_posts" do
    render
  end
end
