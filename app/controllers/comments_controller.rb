class CommentsController < ApplicationController
def create
    @comment = current_customer.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: cosmetics_path)
    else
      redirect_back(fallback_location: cosmetics_path)
    end
end

  private
  def comment_params
    params.require(:comment).permit(:introduction, :cosmetic_id)
  end
end
