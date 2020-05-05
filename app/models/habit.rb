class Habit < ApplicationRecord
    belongs_to :user
    has_many :habit_tags, dependent: :destroy
    has_many :tags, through: :habit_tags
    accepts_nested_attributes_for :habit_tags

    has_many :plans
    has_many :reals, dependent: :destroy

    validates :name, presence: true
    validates :target, presence: true
end
