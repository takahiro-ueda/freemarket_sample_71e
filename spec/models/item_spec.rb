require 'rails_helper'

describe Item do
  describe '#create' do
    # 1. 商品名が空では登録できないこと
    it "商品名が空では登録できないこと" do
      item = build(:item, name: nil)
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

    #nameの文字が40文字以上の場合
    it "商品名の文字が40文字以上場合" do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("入力は４０文字までです。")
    end

    it "商品説明の文字が600文字以上の場合" do
      item = build(:item, introduction: "a" * 601)
      item.valid?
      expect(item.errors[:introduction]).to include("入力は６００文字までです。")
    end

    #priceが9999999円以上の場合
    it "価格が9999999円以上の場合" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("入力は数字のみ300〜9999999までです。")
    end

    #priceが300円以下の場合
    it "価格が300円以下の場合" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("入力は数字のみ300〜9999999までです。")
    end

    #brandの文字が40文字以上場合
    it "ブランドの文字が40文字以上の場合" do
      item = build(:item, brand: "a" * 41)
      item.valid?
      expect(item.errors[:brand]).to include("入力は４０文字までです")
    end
    
  end
end

