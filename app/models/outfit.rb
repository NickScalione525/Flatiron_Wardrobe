class Outfit < ApplicationRecord

    default_scope { order(times_worn: :desc) }

    has_many :styles
    has_many :users, through: :styles
    

    # validate :is_title_case

    # before_validation :make_title_case

    # accepts_nested_attributes_for :styles

    

    validates :name, presence: true


    def styles_attributes=(attrs)

    attrs.values.each do |hash|
        if hash[:id]
            s = Style.find_by(id: hash[:id])
            s.update(hash)
        else
        self.styles.build(hash)
        end
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
