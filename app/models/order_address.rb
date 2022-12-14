class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id, :token

   with_options presence: true do

    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
   end


  def save
    order = Order.create( user_id: user_id,item_id: item_id)
    Address.create( post_code: post_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end