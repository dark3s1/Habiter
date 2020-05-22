class Tag < ApplicationRecord
    belongs_to :user
    has_many :habit_tags, dependent: :destroy
    has_many :habits, through: :habit_tags
    
    validates :name, presence: true, uniqueness: { scope: :user_id }
end
