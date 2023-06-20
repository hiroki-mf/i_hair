class Admin::CosmeticsController < ApplicationController
  
def new
  @cosmetic = Cosmetic.new
end

def create
  @cosmetic = Cosmetic.new(cosmetic_params)
if @cosmetic.save
    redirect_to  admin_cosmetic_path(@cosmetic.id)
else
    render :new
end
end
  
def show
  @cosmetic = Cosmetic.find(params[:id])
  @comments = @cosmetic.comments #投稿詳細に関連付けてあるコメントを全取得
end

def destroy
  cosmetic = Cosmetic.find(params[:id])
  cosmetic.destroy
  redirect_to admin_root_path
end
  
private
  # ストロングパラメータ
def cosmetic_params
  params.require(:cosmetic).permit(:text, :image, :star)
end

end
