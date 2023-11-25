class User < ApplicationRecord 
    validates :username, presence: true 
    validates :username, uniqueness: true 

    has_many :gardens,
        foreign_key: :garden_owner_id,
        class_name: :Garden,
        inverse_of: :garden_owner,
        dependent: :destroy 

    has_many :flowers,
        foreign_key: :gardener_id,
        class_name: :Flower,
        inverse_of: :gardener,
        dependent: :destroy 

    has_many :flowers_in_all_gardens,
        through: :gardens,
        source: :flowers
    
    has_many :gardens_with_my_flowers,
        through: :flowers,
        source: :garden
end