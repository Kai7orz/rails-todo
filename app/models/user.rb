class User < ApplicationRecord
    has_secure_password
    has_many :tasks, dependent: :destroy
    validates :user_name, presence: true
    validates :user_mail, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
