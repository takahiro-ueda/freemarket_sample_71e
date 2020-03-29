class ItemsController < ApplicationController
  def index
    # @parents = Category.all.order("id ASC").limit(13)
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
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
    params.require(:item).permit(:name, :price, :introduction, item_images_attributes: [:image])
  end

  def set_item
  end
  
end