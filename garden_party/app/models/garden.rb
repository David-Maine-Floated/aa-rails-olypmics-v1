class Garden < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: {scope: :garden_owner_id}
    validates :size, presence: true
    
    belongs_to :garden_owner,
        foreign_key: :garden_owner_id,
        class_name: :User,
        required: true,
        dependent: :destroy 

    has_many :flowers,
        foreign_key: :garden_id,
        class_name: :Flower,
        dependent: :destroy

end