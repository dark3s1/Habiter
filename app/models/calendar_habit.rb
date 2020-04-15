class CalendarHabit < ApplicationRecord
  belongs_to :calendar
  belongs_to :habit
  
  validates :calendar_id, :uniqueness => { :scope => :habit_id }

end
