class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :user_name, presence: true
    validates :user_mail, presence: true, uniqueness: true
    validates :user_password, presence: true
end
