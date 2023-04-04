class Coordinate < ApplicationRecord
  acts_as_paranoid
  belongs_to :address
end
