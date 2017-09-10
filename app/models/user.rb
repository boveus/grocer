class User < ApplicationRecord
has_many :recipes
has_one :pantry
has_one :grocery_list
has_many :recipe_ingredients, through: :recipes
has_many :pantry_ingredients, through: :pantry
has_secure_password

validates :name, :email, :password_digest, presence: true
validates :email, uniqueness: true
end
