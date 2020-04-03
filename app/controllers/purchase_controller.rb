class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_card, only: [:index, :done, :pay]
  before_action :set_item, only: [:index, :done, :pay]

  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_credit_path #action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_credit_information = customer.cards.retrieve(@card.number)

      @prefecture = Prefecture.find(current_user.address.prefecture_id).name # ログインユーザが持つ、prefecture_IDの都道府県を抽出する
    end
  end

  def done
    
    # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    #保管した顧客IDでpayjpから情報取得
    customer = Payjp::Customer.retrieve(@card.customer_id)
    #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    @default_credit_information = customer.cards.retrieve(@card.number)

    @prefecture = Prefecture.find(current_user.address.prefecture_id).name # ログインユーザが持つ、prefecture_IDの都道府県を抽出する

    # @product_purchaser= Trade.find(params[:item_id])
    @item_purchaser = Item.find(params[:item_id])
    @item_purchaser.update(buyer_id: current_user.id)
  end

  def pay
    
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      :amount => @item.price, #支払金額（itemテーブル等に紐づけても良い）
      :customer => @card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    @item.buyer_id = current_user.id
    @item.save
    redirect_to action: 'done' #完了画面に移動
  end

  private

  def set_card
    @card = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
     #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
