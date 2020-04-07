class LikesController < ApplicationController
  before_action :set_item, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    @likes = Like.where(item_id: params[:item_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
    @likes = Like.where(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
    @items = Item.includes(:images).order(:item_purchaser_id, "id DESC")
  end
end
