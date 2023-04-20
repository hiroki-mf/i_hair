class Public::ReviewController < ApplicationController
    def new
     @review = Review.new
    end
    
    def index
     @reviews = Review.all
     @review = Review.new
     @customer = current_customer
    end
    
    def create
     @review = Review.new(review_params)
     @review.customer_id = current_customer.id
     @customer = current_customer
    if @review.save
     flash[:notice] = 'You have created review successfully.'
     redirect_to review_path(@review.id)
    else
     @reviews = Review.all
     render :index
    end
    end
    
    def show
     @review = Review.find(params[:id])
     @review_new = Review.new
    end
    
    private
    # ストロングパラメータ
    def review_params
     params.require(:review).permit(:introduction, :image).merge(customer_id: current_customer.id)
    end
    
end
