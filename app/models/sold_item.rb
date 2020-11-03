class SoldItem
  include ActiveModel::Model
  attr_accessor   :authenticity_token,
                  :user_id, :item_id,
                  :post_number,
                  :prefecture_id, 
                  :city, :address, 
                  :building, 
                  :phone_number, 
                  :sold_id

  validates :user_id, presence: true
  validates :item_id,  presence: true
  validates :post_number,  presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city,  presence: true
  validates :address, presence: true
  validates :phone_number,  presence: true


  

  def save
    sold = Sold.create(item_id:item_id,  user_id: user_id)
    Delivery.create(post_number:  post_number, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, sold_id: sold.id)

  end
end