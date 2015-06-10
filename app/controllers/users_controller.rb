class UsersController < ApplicationController
  before_action :authenticate_user!  
  expose_decorated(:reviews, ancestor: :current_user)

  def show
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
