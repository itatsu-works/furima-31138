require 'rails_helper'

RSpec.describe SoldItem, type: :model do
  describe  '購入情報の保存'  do
    before  do
      @sold_item = FactoryBot.build(:sold_item)
    end
    context '購入がうまくいく時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@sold_item).to be_valid
      end
    end
    
    context '購入がうまくいかない時' do
      it '郵便番号(post_number)が入力されていなければ、保存できないこと' do
        @sold_item.post_number = nil
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Post number can't be blank","Post number is invalid")
      end
      it '郵便番号にハイフンがなければ入力できないこと' do
        @sold_item.post_number = '1234567'
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Post number is invalid")
      end
      it '都道府県(prefecture_id)が選択されていなければ保存できない' do
        @sold_item.prefecture_id = 1
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村(city)が入力されていなければ保存できない' do
        @sold_item.city = nil
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("City can't be blank")
      end
      it '番地(address)が入力されていなければ保存できない' do
        @sold_item.address = nil
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号(phone_number)が入力されていなければ保存できない' do
        @sold_item.phone_number = nil
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Phone number can't be blank","Phone number is invalid")
      end
      it '電話番号が番号でなければ保存できない' do
        @sold_item.phone_number = 'abcdefghijk'
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが入力されていなければ登録できないこと' do
        @sold_item.token = nil
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Token can't be blank")
      end
      it '電話番号が12桁以上では保存できない' do
        @sold_item.phone_number = '123456789101'
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
