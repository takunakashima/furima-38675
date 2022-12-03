class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX , message:'is invalid. Include both letters and numbers'}
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :first_name_kana, presence: true, format: { with: KATAKANA_REGEXP, message:'is invalid. Input full-width characters' }
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :last_name_kana, presence: true, format: { with: KATAKANA_REGEXP, message:'is invalid. Input full-width characters' }
  validates :birthday, presence: true
       
  has_many :items
  has_many :orders
  
end
