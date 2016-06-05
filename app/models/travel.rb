class Travel < ActiveRecord::Base

  has_many :cities
  has_many :meals
  has_many :fuels
  has_many :lodgings
  has_many :toll_booths
  accepts_nested_attributes_for :meals, :lodgings, :fuels, :toll_booths
  has_one :vehicle
  def total_meal_amount
    meals.map(&:total).sum
  end

  def total_fuel_amount
    fuels.map(&:total).sum
  end

  def total_lodging_amount
    lodgings.map(&:total).sum
  end

  def total_toll_booth_amount
    toll_booths.map(&:total).sum
  end

end
