class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :day
  belongs_to_active_hash :status

  validates :price, :days_id, :area_id, :cost_burden_id, :status_id, :category_id, :description, :name, presence: true
  
  validates :days_id, :area_id, :cost_burden_id, :status_id, :category_id, numericality: { other_than: 1 }

end
