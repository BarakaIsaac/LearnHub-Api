class User < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :role, presence: true
end