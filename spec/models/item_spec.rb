require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品出品できるとき' do
      it '商品画像〜販売価格が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
  
    context '商品出品できない時' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明が空では出品できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end

      it 'カテゴリーが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください")
      end

      it '商品の状態が空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は数値で入力してください")
      end

      it '配送料の負担が空では出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は数値で入力してください")
      end

      it '発送元の地域が空では出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は数値で入力してください")
      end

      it '発送までの日数が空では出品できない' do
        @item.days_required_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送日の目安は数値で入力してください")
      end

      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格を入力してください")
      end

      it '商品名が40文字以上だと出品できない' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end

      it '商品説明が1000文字以上だと出品できない' do
        @item.explain = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明は1000文字以内で入力してください")
      end

      it '販売価格が¥300以下だと出品できない' do
        @item.price ='299'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格は300以上の値にしてください")
      end

      it '販売価格が¥9,999,999以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格は9999999以下の値にしてください")
      end

      it '販売価格が半角数値以外だと出品できない' do
        @item.price = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格は数値で入力してください")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.days_required_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送日の目安は数値で入力してください")
      end

      it 'userが結びついていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
      
    end
  end
end
