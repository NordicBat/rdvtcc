class Vehicle < ActiveRecord::Base
  belongs_to :travel
  validates :licensePlate, uniqueness: true
  validates :brand, presence: true
  validates :model, presence: true

end
