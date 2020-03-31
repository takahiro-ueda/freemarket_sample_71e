class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.includes(:item_images).order(created_at: "DESC").limit(3)
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
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.seller_id)
    @category = @item.category
    @size = @item.size
    @status = Status.find(@item.status_id)
    @delivery = Delivery.find(@item.delivery_id)
    @payer = Payer.find(@item.payer_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @duration = Duration.find(@item.duration_id)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
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

  def set_items_image
    @items = Item.includes(:images).order(:item_purchaser_id, "id DESC")
  end
  
end