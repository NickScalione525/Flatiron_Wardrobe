class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    has_many :styles
    has_many :outfits, through: :styles

    has_secure_password

    validates :username, presence: true, uniqueness: true




    
end
