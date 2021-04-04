class Outfit < ApplicationRecord
    has_many :users, through: :styles
    has_many :styles

    validate :is_title_case

    before_validation :make_title_case

    accepts_nested_attributes_for :styles


    def styles_attributes=(attrs)

    attrs.values.each do |hash|
        s = Style.create(hash)
        self.styles.create(hash)
    end
end


    def is_title_case
        if self.name != self.name.titlecase
            self.errors.add(:name, "must be title-cased")
        end

    end


    def make_title_case
        self.name = self.name.titlecase
    end


end
