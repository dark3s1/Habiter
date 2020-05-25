class Real < ApplicationRecord
  belongs_to :habit, optional: true
  belongs_to :user, optional: true
  acts_as_list :scope => :user
  attr_accessor :date
  
  validates :time, presence: true
  validates :start_time, presence: true
  validates :habit_id, uniqueness: { scope: [:start_time, :user_id]}
end

