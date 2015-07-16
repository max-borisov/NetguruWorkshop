class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_only, except: [:index, :show]

  expose(:categories)
  expose(:category)

  def index
  end

  def edit
  end

  def create
    self.category = Category.new(category_params)

    if category.save
      redirect_to categories_path, notice: 'Category was successfully created'
    else
      render :new
    end
  end

  def update
    if category.update(category_params)
      redirect_to category_products_path(category), notice: 'Category was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed'
  end

  private
    def admin_only
      redirect_to new_user_session_path unless current_user.admin?
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
