class ItemOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id,:token

with_options presence: true do
  validates :postal_code
  validates :municipality
  validates :address
  validates :phone_number
  validates :token
end

validates :prefecture_id, numericality: { other_than: 1 }
validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                 building_name: building_name, phone_number: phone_number, user_item_id: user_item.id)
  end
end