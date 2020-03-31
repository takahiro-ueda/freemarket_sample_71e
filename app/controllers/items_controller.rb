class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

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
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
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
      :trade_id,
      :size_id,
      :status_id,
      :brand,
      item_images_attributes: [:image, :_destroy, :id]
      ).merge(seller_id: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end