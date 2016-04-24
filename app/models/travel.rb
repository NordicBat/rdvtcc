class Travel < ActiveRecord::Base
  belongs_to :city
  belongs_to :vehicle
  belongs_to :meal
  belongs_to :fuel
  belongs_to :lodging
  belongs_to :tollBoth
  has_many :cities 
  has_many :meals 
  has_many :fuels 
  has_many :lodgings 
  has_many :toll_boths
end
