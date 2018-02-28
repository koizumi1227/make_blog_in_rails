require 'rails_helper'

RSpec.describe User, type: :model do

  it "valid factory" do
    expect(build(:user)).to be_valid
  end


  it "username, email, password が有効な場合" do
    user = User.new(
      username: "usersample",
      email: "usersample@example.com",
      password: "password"
    )
    expect(user).to be_valid
  end

  describe "未入力" do
    it "username が未入力の場合" do
      user = build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include "を入力してください",
        "は2文字以上で入力してください"
    end

    it "email が未入力の場合" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include "を入力してください"
    end

    it "password が未入力の場合" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include "を入力してください"
    end
  end

  describe "重複登録" do
    it "usenameを重複登録するとき無効の場合" do
      user = create(:user, username: "Newuser")
      other_user = build(:user, username: "Newuser")
      other_user.valid?
      expect(other_user.errors[:username]).to include "はすでに存在します"
    end

    it "emailを重複登録するとき無効の場合" do
      user = create(:user, email:"usersample@sample.com")
      other_user = build(:user, email:"usersample@sample.com")
      other_user.valid?
      expect(other_user.errors[:email]).to include "はすでに存在します"
    end
  end

  describe "文字数" do
    it "usernameが2字の場合" do
      user = build(:user, username: "a" * 2)
      user.valid?
      expect(user).to be_valid
    end
    it "usernameが1字以下の無効の場合" do
      user = build(:user, username: "a" * 1)
      user.valid?
      expect(user.errors[:username]).to include "は2文字以上で入力してください"
    end
    it "usernameが20字の場合" do
      user = build(:user, username: "a" * 20)
      user.valid?
      expect(user).to be_valid
    end
    it "usernameが21字以上の無効の場合" do
      user = build(:user, username: "a" * 21)
      user.valid?
      expect(user.errors[:username]).to include "は20文字以内で入力してください"
    end
  end

  describe "正規表現" do
    it "有効な場合" do
      expect(:user).to match(/^[a-zA-Z0-9_]*$/)
    end

    it "無効な場合" do
      user = build(:user, username:"~|?usersample")
      user.valid?
      expect(user.errors[:username]).to include "は不正な値です"
    end
  end

end
