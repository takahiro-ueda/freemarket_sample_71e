class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comment = Comment.new
  end

  def create
    item = Item.find(params[:item_id])
    @comment = item.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  # def destroy
  #   image = Image.find(params[:image_id])
  #   @comment = image.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_back(fallback_location: image_path(image)
  # end 

  private

  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end
end
