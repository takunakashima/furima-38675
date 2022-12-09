class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id

   with_options presence: true do

    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }

   end


  def save
    order = Order.create(price: price, user_id: user_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, order_id: order_id, user: user,item: item)
  end
end