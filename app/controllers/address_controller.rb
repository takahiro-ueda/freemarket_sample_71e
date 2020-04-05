class AddressController < ApplicationController

  def show
    @address = Address.find(params[:id])
    @prefecture = @address.prefecture
    @user = @address.user
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = '編集に失敗しました。'
      render :edit
    end
  end



  private

  def address_params
    params.require(:address).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :tel,
      :prefecture_id,
      :zip_code,
      :municipality,
      :address,
      :building_name
    ).merge(user_id: current_user.id)
  end
end
