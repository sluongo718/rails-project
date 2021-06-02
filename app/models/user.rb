class User < ApplicationRecord
    has_many :recipes

    has_secure_password

    validates :name, presence: true 

    validates :email, uniqueness: true, presence: true
    validates :email, confirmation: true

    scope :most_popular_user, -> { joins(:recipes).group("user_id").order("count(user_id) DESC").first }

end
