class Outfit < ApplicationRecord
    has_many :users 
    has_many :styles, through: :users

    validate :is_title_case

    before_validation :make_title_case



    def is_title_case
        if self.name != self.name.titlecase
            self.errors.add(:name, "must be title-cased")
        end

    end


    def make_title_case
        self.name = self.name.titlecase
    end


end
