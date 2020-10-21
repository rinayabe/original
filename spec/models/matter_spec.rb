require 'rails_helper'
RSpec.describe Matter, type: :model do
  before do
    @matter = FactoryBot.build(:matter)
  end

  context '出品がうまくいくとき' do
    it 'imageがあれば登録できること' do
      expect(@matter).to be_valid
    end

    it 'nameがあれば登録できること' do
      @matter.name = 'aaa'
      expect(@matter).to be_valid
    end

    it 'explainがあれば登録できること' do
      @matter.explain = 'あいう'
      expect(@matter).to be_valid
    end

    it 'priceがあれば登録できること' do
      @matter.price = '555'
      expect(@matter).to be_valid
    end
  end

  context '出品がうまくいかないとき' do
    it 'imageが空なら登録できない' do
      @matter.image = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空なら登録できない' do
      @matter.name = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include("Name can't be blank")
    end

    it 'explainが空なら登録できない' do
      @matter.explain = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include("Explain can't be blank")
    end

    it 'priceが空なら登録できない' do
      @matter.price = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが0円であれば登録できない' do
      @matter.price = '0'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('Price is not included in the list')
    end

    it 'priceが1,000,000,000円以上であれば登録できない' do
      @matter.price = '1000000000'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('Price is not included in the list')
    end
  end
end
