class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_access, only: [:destroy]

  expose(:review)
  expose(:product)
  expose(:category)

  def create
    self.review = product.reviews.build(review_params)
    review.user_id = current_user.id

    if review.save
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created'
    else
      render :new
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_path(product.category, product), notice: 'Review was successfully destroyed'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end

    def check_access
      unless (current_user.id == review.user_id || current_user.admin?)
        redirect_to category_product_path(product.category, product), flash: { error: 'You do not have credentials to delete that review' }
      end
    end
end
