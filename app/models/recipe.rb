class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true
  validates :summary, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5 MB")
      end
    end
  
end