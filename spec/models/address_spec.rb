require 'rails_helper'

describe Address do
  describe '#create' do
    # 送付先登録を入力できるか
    it "送付先登録を入力できるか" do
      address = build(:address)
      expect(address).to be_valid
    end
    # 姓名の全角でなければ入力できない
    it "姓名の全角でなければ入力できない" do
      address = build(:address, family_name: "test")
      address.valid?
      expect(address.errors[:family_name]).to include("全角で入力してください")
    end
    # 姓名がなければ入力できない
    it "姓名の全角であれば入力できる" do
      address = build(:address, family_name_kana: nil)
      address.valid?
      expect(address.errors[:family_name_kana]).to include("を入力してください")
    end
    # 姓名（カナ）がなければ入力できない
    it "カナでなければ入力できない" do
      address = build(:address, family_name_kana: nil)
      address.valid?
      expect(address.errors[:family_name_kana]).to include("を入力してください")
    end
    # 姓名（カナ）がカナでなければ入力できない
    it "姓名（カナ）がカナでなければ入力できない" do
      address = build(:address, family_name_kana: "test")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("カタカナ以外の文字が入力されています")
    end
    # 電話番号10桁11桁以外であれば入力できない
    it "電話番号10桁11桁以外であれば入力できない" do
      address = build(:address, tel: "test")
      address.valid?
      expect(address.errors[:tel]).to include("電話番号は10桁か11桁で入力してください")
    end
    # 郵便番号が７桁数字以外であれば入力できない
    it "郵便番号が７桁数字以外であれば入力できない" do
      address = build(:address, zip_code: "test")
      address.valid?
      expect(address.errors[:zip_code]).to include("ハイフンなしで７桁の数字を入力してください")
    end
  end
end

