class User < ApplicationRecord
    has_many :recipes

    has_secure_password

    validates :name, presence: true 

    validates :email, uniqueness: true, presence: true
    validates :email, confirmation: true

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
       
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end
    end





    scope :most_popular_user, -> { joins(:recipes).group("user_id").order("count(user_id) DESC").first }

end
