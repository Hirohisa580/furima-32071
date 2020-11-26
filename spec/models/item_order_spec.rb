require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end
  
  describe "商品の購入" do
    context "購入が上手くいく時" do
      it "postal_codeとmunicipalityとaddressとphone_numberが入力され、紐づくuser_idとitem_idが存在し、prefecture_idが１以外が選ばれ、tokenが存在していれば購入できる" do
        expect(@item_order).to be_valid
      end

      it "建物名が入力されていなくても購入できる" do
        @item_order.building_name = nil
        expect(@item_order).to be_valid
      end
    end

    context "購入が上手くいかない時" do
      it "postal_codeが空の場合購入できない" do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "municipalityが空の場合購入できない" do
        @item_order.municipality = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Municipality can't be blank")
      end

      it "addressが空の場合購入できない" do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numbeが空の場合購入できない" do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "tokenが存在しない場合購入できない" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it "prefecture_idが１の場合購入できない" do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
      end



      it "postal_codeにハイフンが無ければ購入できない" do
        @item_order.postal_code = "1234567"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが全角だと購入できない" do
        @item_order.postal_code = "１２３-４５６７"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが３桁ハイフン４桁で無ければ購入できない" do
        @item_order.postal_code = "1234-567"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが文字では購入できない" do
        @item_order.postal_code = "abc-defg"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end



      it "phone_numberにハイフンが含まれていると購入できない" do
        @item_order.phone_number = "090-1234-5678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが全角だと購入できない" do
        @item_order.phone_number = "０９０１２３４５６７８"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが12桁以上だと購入できない" do
        @item_order.phone_number = "090123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberに9桁以下だと購入できない" do
        @item_order.phone_number = "090123456"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが文字だと購入できない" do
        @item_order.phone_number = "abcdefghijk"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
