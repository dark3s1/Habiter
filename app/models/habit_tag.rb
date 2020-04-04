class HabitTag < ApplicationRecord
  belongs_to :habit
  belongs_to :tag
  
  validates :habit_id, :uniqueness => { :scope => :tag_id }
end
