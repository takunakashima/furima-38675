class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :days_required
  belongs_to :user
  has_one :order

  has_one_attached :image


  validates :item_name, presence: true, length: { maximum: 40 }
  validates :explain, presence: true,     length: { maximum: 1000 }
  
  validates :price, presence: true, numericality: {only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :days_required_id, numericality: { other_than: 1 }
  validates :image, presence: true

  
  end
