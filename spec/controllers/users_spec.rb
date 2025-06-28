require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe "サインアップが正常にできるか" do
        let(:user) { FactoryBot.build(:user) }
        it "/users/signup に情報をpost して， redirect to /users/:id へリダイレクト可能か" do
            # user を生成する．
            # params[:user][:user_name] ... が埋まるように設定しpost
            # post url , params: {user: {user_name: user.user_name , user_mail: user.user_mail , password_digest: user.password_digest}}
            # post する情報を記述　signup アクションが何を受け取るべきか確認する
            valid_params = { name: user.user_name, mail: user.user_mail, password_digest: user.password_digest }
            expect { post "/users", params: { user: valid_params } }.to change(User, :count).by(+1)

            created_user = User.find_by(user_mail: user.user_mail)

            expect(response).to redirect_to("/users/#{created_user.id}")
        end
    end

    describe "GET /users/login" do
        it "return http success" do
            get "/users/login"
            expect(response).to have_http_status(:success)
        end
    end


    describe "user delete function successfully and return to login page" do
       let(:user) { FactoryBot.create(:user) }
       it "user delete and redirect to /users/login" do
            # /users/:id に向けて id を入れてポストする
            # DB から idをFind トライしてエラーor nil をもらうことを検証する
            delete "/users/#{user.id}"

            expect(response).to redirect_to("/users/login")

            expect(User.find_by(id: user.id)).to be_nil
       end
    end

    describe "DB に存在しないデータのユーザでログインしようとした場合はエラーを返す" do
        let(:user) { FactoryBot.create(:user) }
        it "return http error" do
          # user オブジェクトを用いて，/users/validate に post する
          #
        end
    end

    describe "DB に登録済みのログイン validation " do
        let(:user) { FactoryBot.create(:user) }
        it "redirect to /users/:id" do
        end
    end
end
