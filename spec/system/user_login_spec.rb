RSpec.describe User, type: :system do
  let(:non_exist_user) { FactoryBot.build(:non_exist_user) }

    it "存在しないユーザー情報ではログイン不可能で /users/login へリダイレクト" do
        visit "/users/login"
        fill_in "user_name", with: non_exist_user.user_name
        fill_in "user_mail", with: non_exist_user.user_mail
        fill_in "user_password", with: non_exist_user.user_password
        click_button "login"
        expect(page).to have_current_path("/users/login")
    end
end
