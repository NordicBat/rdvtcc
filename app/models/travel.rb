class Travel < ActiveRecord::Base
  
  has_many :cities
  has_many :meals
  has_many :fuels
  has_many :lodgings
  has_many :toll_boths
  accepts_nested_attributes_for :meals
  has_one :vehicle
end
