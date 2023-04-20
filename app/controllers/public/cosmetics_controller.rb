class Public::CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.all
  end
  
  def show
    @cosmetic = Cosmetic.find(params[:id])
    @review = Review.new
  end

  private
  def item_params
    params.require(:cosmetics).permit(:image, :name)
  end
end
