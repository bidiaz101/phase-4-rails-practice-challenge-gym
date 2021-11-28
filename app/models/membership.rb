class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client
    validates :charge, numericality: { greater_than: 0 }
    validates :client_id, uniqueness: { scope: :gym_id, 
        message: 'can have only one membership with a gym' }
end
