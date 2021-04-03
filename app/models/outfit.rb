class Outfit < ApplicationRecord
    has_many :users 
    has_many :styles, through: :users
end
