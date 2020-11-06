class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :sold
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :day
  belongs_to_active_hash :status

  with_options presence: true do
    validates :price
    validates :day_id
    validates :area_id
    validates :cost_burden_id
    validates :status_id
    validates :category_id
    validates :description
    validates :name
    validates :image
  end

  validates :day_id, :area_id, :cost_burden_id, :status_id, :category_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
