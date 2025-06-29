FactoryBot.define do
  factory :user do
      user_name { "test_kaitkai" }
      user_mail { "aaa@example.com " }
      password { "password" }
      password_confirmation { "password" }
  end

  factory :non_exist_user, class: User do
      user_name { "fake_user" }
      user_mail { "nonexist@example.com" }
      password { "password" }
      password_confirmation { "password" }
  end
end
