require 'rails_helper'

RSpec.describe "Users", type: :request do 
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
end 