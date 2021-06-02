class Recipe < ApplicationRecord
    belongs_to :user

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    has_many :recipe_categories
    has_many :categories, through: :recipe_categories

    accepts_nested_attributes_for :categories

    validates :name, presence: true
    validates :cook_time, numericality: {only_integer: true}
    validates :directions, presence: true
end
