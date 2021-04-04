class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    has_many :outfits
    has_many :styles, through: :outfits

    has_secure_password




    
end
