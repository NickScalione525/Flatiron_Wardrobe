class Style < ApplicationRecord
    belongs_to :user
    belongs_to :outfit

    validates :name, presence: true
end
