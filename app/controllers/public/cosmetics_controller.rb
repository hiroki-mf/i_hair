class Public::CosmeticsController < ApplicationController
    def new
     @cosmetic = Cosmetic.new
    end
    
    def index
     @cosmetics = Cosmetic.all
     @customer = current_customer
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
    end
    
    private
    # ストロングパラメータ
    def cosmetic_params
     params.require(:cosmetic).permit(:text, :image)
    end
    
end