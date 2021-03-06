class SoldItem
  include ActiveModel::Model
  attr_accessor   :authenticity_token,
                  :user_id, :item_id,
                  :post_number,
                  :prefecture_id, 
                  :city, :address, 
                  :building, 
                  :phone_number, 
                  :sold_id,
                  :token,
                  :price
                  
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
  validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: {with: /\A\d{10,11}\z/ }

  validate :add_error_token

  def add_error_token
    if token.blank?
      errors[:base] << "Please re-enter your card information"
    end
  end

  def save
    sold = Sold.create(item_id:item_id,  user_id: user_id)
    Delivery.create(post_number:  post_number, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, sold_id: sold.id)
  end
end