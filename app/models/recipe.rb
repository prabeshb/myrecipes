class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true
  
  validates :summary, presence: true, length: { maximum: 100 }
  
  validates :description, length: { maximum: 1000}
  
end