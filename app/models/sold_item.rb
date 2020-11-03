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
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
  end
  
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :post_number, format: { with: /\A{3}[-]\z{4}/ }
  validates :phone_number,  numericality: { /\A\d{10,11}\z/ }

  def save
    sold = Sold.create(item_id:item_id,  user_id: user_id)
    Delivery.create(post_number:  post_number, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, sold_id: sold.id)

  end
end