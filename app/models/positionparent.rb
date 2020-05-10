class Positionparent < ApplicationRecord
  has_many :reals, -> { order(position: :asc) }
  
  accepts_nested_attributes_for :reals
end
