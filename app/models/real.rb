class Real < ApplicationRecord
  belongs_to :habit, optional: true
  
  acts_as_list
  attr_accessor :date
  
  validates :time, presence: true
  validates :start_time, presence: true
end

