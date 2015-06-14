class CommentsController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.build(comment_params.merge(:user => current_user))

    if @comment.save
      redirect_to @link, notice: "Comment successful."  
    else
      render new, notice: "Comment failed"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end