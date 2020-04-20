class Real < ApplicationRecord
  belongs_to :habits
  
  def start_time
    self.date
  end
end
