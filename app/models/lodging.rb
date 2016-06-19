class Lodging < ActiveRecord::Base
  belongs_to :travel
  validates :date, presence: true
  validates :total, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
