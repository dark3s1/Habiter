class Calendar < ApplicationRecord
  belongs_to :user
  has_many :calendar_habits
  has_many :habits, through: :calendar_habits
  accepts_nested_attributes_for :calendar_habits
end
