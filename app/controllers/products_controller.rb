class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_access, only: [:edit, :update, :destroy]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def create
    self.product = current_user.products.create(product_params)

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created'
    else
      render :new
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    product.destroy
    redirect_to category_products_path(category), notice: 'Product was successfully destroyed'
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id, :preview)
    end

    def check_access
      unless (product.belongs_to_user?(current_user) || current_user.admin?)
        redirect_to category_product_path(category, product), flash: { error: 'You are not allowed to fulfill this action' }
      end
    end
end
