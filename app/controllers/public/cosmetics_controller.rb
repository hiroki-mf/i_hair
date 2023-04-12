class Public::CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.all
  end

  
  private
  def item_params
    params.require(:cosmetics).permit(:image)
  end
end
