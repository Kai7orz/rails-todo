FactoryBot.define do
  factory :user do
      user_name { "test kaitkai " }
      user_mail { "aaa@example.com " }
      password_digest { "password" }
  end

  factory :non_exist_user, class: User do
      user_name { "fake_user" }
      user_mail { "nonexist@example.com" }
      password_digest { "password" }
  end
end
