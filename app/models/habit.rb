class Habit < ApplicationRecord
    belongs_to :user
    has_many :habit_tags
    has_many :tags, through: :habit_tags
    accepts_nested_attributes_for :habit_tags
end
