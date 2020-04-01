require 'rails_helper'

describe Item do
  describe '#create' do
    # 1. 商品名が空では登録できないこと
    it "商品名が空では登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    # 2. 商品説明が空では登録できないこと
    it "商品説明が空では登録できないこと" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end
    # 9. 価格が空では登録できないこと
    it "価格が空では登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    # # 姓名の全角でなければ入力できない
    # it "姓名の全角でなければ入力できない" do
    #   address = build(:address, family_name: "test")
    #   address.valid?
    #   expect(address.errors[:family_name]).to include("全角で入力してください")
    # end
    # # 姓名がなければ入力できない
    # it "姓名の全角であれば入力できる" do
    #   address = build(:address, family_name_kana: nil)
    #   address.valid?
    #   expect(address.errors[:family_name_kana]).to include("を入力してください")
    # end
    # # 姓名（カナ）がなければ入力できない
    # it "カナでなければ入力できない" do
    #   address = build(:address, family_name_kana: nil)
    #   address.valid?
    #   expect(address.errors[:family_name_kana]).to include("を入力してください")
    # end
    # # 姓名（カナ）がカナでなければ入力できない
    # it "姓名（カナ）がカナでなければ入力できない" do
    #   address = build(:address, family_name_kana: "test")
    #   address.valid?
    #   expect(address.errors[:family_name_kana]).to include("カタカナ以外の文字が入力されています")
    # end
    # # 電話番号10桁11桁以外であれば入力できない
    # it "電話番号10桁11桁以外であれば入力できない" do
    #   address = build(:address, tel: "test")
    #   address.valid?
    #   expect(address.errors[:tel]).to include("電話番号は10桁か11桁で入力してください")
    # end
    # # 郵便番号が７桁数字以外であれば入力できない
    # it "郵便番号が７桁数字以外であれば入力できない" do
    #   address = build(:address, zip_code: "test")
    #   address.valid?
    #   expect(address.errors[:zip_code]).to include("ハイフンなしで７桁の数字を入力してください")
    # end
  end
end

