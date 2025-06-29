RSpec.describe User, type: :system do

  describe "存在しないユーザーによるログイン" do 
    let(:non_exist_user) { FactoryBot.build(:non_exist_user) }
    it "存在しないユーザー情報ではログイン不可能で /users/login へリダイレクト" do
        visit "/users/login"
        fill_in "user_name", with: non_exist_user.user_name
        fill_in "user_mail", with: non_exist_user.user_mail
        fill_in "password", with: non_exist_user.password
        click_button "login"
        expect(page).to have_current_path("/users/login")
    end
  end

  describe "存在するユーザーによるログイン" do 
    # test user を DB へ登録
    let(:user) { FactoryBot.create(:user) }
    # /users/login へリダイレクト
    # validate_path に対してuser 情報を入力して post 
    # リダイレクトするか確認

    it "ログイン成功後に /users/:id にリダイレクトする"do
      visit "/users/login"
      fill_in "user_name", with: user.user_name 
      fill_in "user_mail", with: user.user_mail 
      fill_in "password", with: user.password
      click_button "login"
      expect(page).to have_current_path("/users/#{user.id}")  
    end
  end
end
