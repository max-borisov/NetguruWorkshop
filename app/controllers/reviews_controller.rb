class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_review_belongs_to_user, only: [:destroy]

  expose(:review)
  expose(:product)
  expose(:category)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.review = product.reviews.build(review_params)
    review.user_id = current_user.id

    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_path(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end

    def ensure_review_belongs_to_user
      if current_user.id != review.user_id
        redirect_to category_product_path(product.category, product), flash: { error: 'You do not have credentials to delete that review.' }
      end
    end
end
