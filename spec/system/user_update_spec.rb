RSpec.describe User, type: :system do
  let(:user) { FactoryBot.create(:user) }

it "データの更新を正常に完了できる" do
    visit "/users/edit/#{user.id}"
    fill_in "user_user_name", with: "New Name"
    click_button "ユーザーデータ更新"
    expect(page).to have_current_path("/users/#{user.id}")
    user.reload
    expect(user.user_name).to eq("New Name")
  end
end
