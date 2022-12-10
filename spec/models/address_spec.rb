require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do

    context '商品購入できるとき' do
      it '（建物名除く）空欄がなければ出品できる' do
        expect(@address).to be_valid
      end
    end
  
    context '商品購入できない時' do

      # <%〜がからでは出品出来ない%>

      it "tokenが空では登録できない" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では購入できない' do
        @address.post_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end

      it '都道府県が空では購入できない' do
        @address.area_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村が空では購入できない' do
        @address.municipalities = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空では購入できない' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      # <%〜が空では出品出来ない%>

      # <%正規表現条件%>
      it '郵便番号は「-」を含まないと購入できない' do
        @address.post_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code is invalid")
      end

      # it '郵便番号が半角入力でないと購入できない' do
      #   @address.post_code = '１２３４５６７'
      #   @address.valid?
      #   expect(@address.errors.full_messages).to include("Post code is invalid)")
      # end

      it '都道府県に「---」が選択されている場合は購入出来ない' do
        @address.area_id = '1' 
        @address.valid?
        expect(@address.errors.full_messages).to include("Area can't be blank")
      end

      it '電話番号が11桁以上だと購入できない' do
        @address.phone_number ='123456789012'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が10桁以下だと購入できない' do
        @address.phone_number = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が半角数値以外で入力されていると購入できない' do
        @address.phone_number = 'ああああああ'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
      # <%正規表現条件%>
      
    end
  end
end
