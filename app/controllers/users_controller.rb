class UsersController < ApplicationController
  def show
    @recent_reviews = current_user.reviews.order(created_at: :desc).limit(5)
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path, notice: 'User profile was updated'
    else    
      render action: 'show'
    end
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email)
    end
end
