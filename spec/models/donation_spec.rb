require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe '#create' do
    before do
      @donation = FactoryBot.build(:donation)
    end

    context '募金がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@donation).to be_valid
      end
    end

    context '募金がうまくいかないとき' do
      it 'tokenが空ならば保存できないこと' do
        @donation.token = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Token can't be blank")
      end

      it 'priceが空なら登録できない' do
        @donation.price = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが50円未満であれば登録できない' do
        @donation.price = '0'
        @donation.valid?
        expect(@donation.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが10,000,000円以上であれば登録できない' do
        @donation.price = '10000000'
        @donation.valid?
        expect(@donation.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
