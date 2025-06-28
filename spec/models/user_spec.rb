require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "名前とメールアドレスとパスワードがあれば登録できる" do
    user = User.new(
      user_name: "test_taro",
      user_mail: "test@example.com",
      user_password: "user_password",
    )

    expect(user).to be_valid
  end
  it "名前がないと登録不可能" do
    user = User.new(
      user_name: nil,
      user_mail: "test@example.com",
      user_password: "user_password",
    )

    user.valid?

    expect(user.errors[:user_name]).to include("can't be blank")
  end

  it "メールアドレスがないと登録不可能" do
      user = User.new(
      user_name: "test",
      user_mail: nil,
      user_password: "user_password",
    )

    user.valid?

    expect(user.errors[:user_mail]).to include("can't be blank")
  end


  it "パスワードがないと登録不可能" do
      user = User.new(
      user_name: "test",
      user_mail: "test@example.com",
      user_password: nil,
    )

    user.valid?

    expect(user.errors[:user_password]).to include("can't be blank")
  end

  it "登録済みメールアドレスのユーザー登録不可能" do
      user1 = User.create(
        user_name: "test1",
        user_mail: "test0@example.com",
        user_password: "password",
      )

      user2 = User.new(
        user_name: "test2",
        user_mail: "test0@example.com",
        user_password: "password",
      )

      expect(user2).to_not be_valid
  end
end
