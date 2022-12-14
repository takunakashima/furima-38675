require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    # sleep 0.3 # 0.3秒待機
  end

  describe '商品購入機能' do

    context '商品購入できるとき' do
      it '空欄がなければ購入できる' do
        expect(@address).to be_valid
      end

      it '建物名が空でも購入できる' do
        @address.building_name = nil
        expect(@address).to be_valid
      end
    end
  
    context '商品購入できない時' do

      # <%〜がからでは出品出来ない%>

      it "tokenが空では登録できない" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it '郵便番号が空では購入できない' do
        @address.post_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '都道府県が空では購入できない' do
        @address.area_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("都道府県を入力してください")
      end

      it '市区町村が空では購入できない' do
        @address.municipalities = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空では購入できない' do
        @address.address = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号が空では購入できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("電話番号を入力してください")
      end

      # <%〜が空では出品出来ない%>


      # <%正規表現条件%>

      it '郵便番号は「-」を含まないと購入できない' do
        @address.post_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it '都道府県に「---」が選択されている場合は購入出来ない' do
        @address.area_id = '1' 
        @address.valid?
        expect(@address.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end

      it '電話番号が12桁以上だと購入できない' do
        @address.phone_number ='123456789012'
        @address.valid?
        expect(@address.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '電話番号が9桁以下だと購入できない' do
        @address.phone_number = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '電話番号が半角数値以外で入力されていると購入できない' do
        @address.phone_number = 'ああああああ'
        @address.valid?
        expect(@address.errors.full_messages).to include("電話番号は不正な値です")
      end

      # <%正規表現条件%>
      
      it 'user_idが結びついていなければ購入できない' do
        @address.user_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("ユーザーを入力してください")
      end

      it 'item_idが結びついていなければ購入できない' do
        @address.item_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("商品コードを入力してください")
      end

    end
  end
end
