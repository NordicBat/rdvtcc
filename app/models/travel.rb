class Travel < ActiveRecord::Base

  has_many :cities, :dependent => :destroy
  has_many :meals, :dependent => :destroy
  has_many :fuels, :dependent => :destroy
  has_many :lodgings, :dependent => :destroy
  has_many :toll_booths, :dependent => :destroy
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

  def km_cost(vehicle_id)
    v = Vehicle.find(vehicle_id)
    (v.odometerActual.to_s.to_d - fuels.map(&:odometer).to_s.to_d)/fuels.map(&:total).to_s.to_d
  end
end
