require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "未入力" do
    before do
      @post = create(:post)
    end

    it "commenter,commentが有効な場合" do
      comment = build(:comment, post: @post)
      comment.valid?
      expect(comment).to be_valid
    end

    it "commneter未入力の時無効な場合" do
      comment = build(:comment, commenter: nil, post: @post)
      comment.valid?
      expect(comment.errors[:commenter]).to include "を入力してください"
    end

    it "commnet未入力の時無効な場合" do
      comment = build(:comment, comment: nil, post: @post)
      comment.valid?
      expect(comment.errors[:comment]).to include "を入力してください"
    end
  end
end
