class CreditController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:delete, :show]
  

  def new
    card = Credit.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      email: current_user.email, 
      card: params['payjp_token'],
      metadata: {user_id: current_user.id}
      ) # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
      
      @card = Credit.new(user_id: current_user.id, customer_id: customer.id, number: customer.default_card)
    
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  
  end

  def delete #PayjpとCardデータベースを削除します
    if @card.blank?
    else 
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_credit_information = customer.cards.retrieve(@card.number)
    end
  end

  private

  def set_card
    @card = Credit.where(user_id: current_user.id).first
  end

  

  def pay_params
    params.permit(:"payjp_token")
  end
  
end
