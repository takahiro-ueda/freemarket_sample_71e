class ItemsController < ApplicationController
  def index
    # @parents = Category.all.order("id ASC").limit(13)
  end

  def new
    # @brand = Brand.all
    # @size = Size.all
    # @category = Category.all
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save!
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
    params.require(:item).permit(
      :name, 
      :price, 
      :introduction, 
      :category_id,
      :delivery_id,
      :payer_id,
      :duration_id,
      :prefecture_id,
      :size_id,
      :status_id,
      :brand_id,
      item_images_attributes: [:image]
      ).merge(seller_id: 1)
  end

  def set_item
  end
  
end