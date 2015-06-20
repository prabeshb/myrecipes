class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes
  validates :chef_id, presence: true
  validates :name, presence: true
  validates :summary, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5 MB")
      end
    end
  
end