require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "未入力" do
    before do
      @user = create(:user)
    end

    it "title,content,status,postimageが有効な場合" do
      post = build(:post, user: @user)
      post.valid?
      expect(post).to be_valid
    end

    it "title未入力の時無効な場合" do
      post = build(:post, title: nil, user: @user)
      post.valid?
      expect(post.errors[:title]).to include "を入力してください"
    end

    it "content未入力の時無効な場合" do
      post = build(:post, content: nil, user: @user)
      post.valid?
      expect(post.errors[:content]).to include "を入力してください"
    end
  end

end
