class User < ApplicationRecord
    has_many :recipes

    has_secure_password

    validates :name, presence: true 

    validates :email, uniqueness: true 
    validates :email, confirmation: true

end
