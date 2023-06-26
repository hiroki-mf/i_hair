class Public::CosmeticsController < ApplicationController
    def new
     @cosmetic = Cosmetic.new
    end
    
    def index
     @customer = current_customer
     @cosmetics = params[:tag_id].present? ? Tag.find(params[:tag_id]).cosmetics : Cosmetic.all
    end
    
    def create
     @cosmetic = current_customer.cosmetics.build(cosmetic_params)
    if @cosmetic.save
     flash[:notice] = 'You have created review successfully.'
     redirect_to cosmetic_path(@cosmetic.id)
    else
     @cosmetics = Cosmetic.all
     render :index
    end
    end
    
    def show
     @cosmetic = Cosmetic.find(params[:id])
     @comments = @cosmetic.comments #投稿詳細に関連付けてあるコメントを全取得
     @comment = current_customer.comments.new
    end
    
    def destroy
     cosmetic = Cosmetic.find(params[:id])
     cosmetic.destroy
     redirect_to cosmetics_path
    end
    
    def search
    if params[:keyword].present?
      @cosmetics = Cosmetic.where('text LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @cosmetics = Cosmetic.all
    end
    end
    
    private
    # ストロングパラメータ
    def cosmetic_params
     params.require(:cosmetic).permit(:text, :image, :star, tag_ids: [])
    end
    
end