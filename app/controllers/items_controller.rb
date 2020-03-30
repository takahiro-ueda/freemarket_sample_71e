class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images).order(created_at: "DESC").limit(3)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def item_params
  end

  def set_item
  end
  
end