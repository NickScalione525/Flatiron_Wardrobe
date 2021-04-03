class User < ApplicationRecord
    has_many :outfits
    has_many :styles, through: :outfits

    has_secure_password


    
end
