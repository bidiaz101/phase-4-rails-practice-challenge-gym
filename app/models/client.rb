class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships
    validates :name, presence: true
    validates :age, numericality: { greater_than: 17 }

    def total_bill
        self.memberships.sum { |mem| mem[:charge] }
    end

end
