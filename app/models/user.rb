class User < ApplicationRecord
    has_many :outfits
    has_many :styles, through: :outfits
end
