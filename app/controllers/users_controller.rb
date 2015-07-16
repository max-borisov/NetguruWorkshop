class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_access
  expose_decorated(:reviews, ancestor: :current_user)

  def update
    if current_user.update(user_params)
      redirect_to user_path, notice: 'User profile was updated'
    else
      render :show
    end
  end

  def destroy
    current_user.destroy
    redirect_to new_user_registration_path, notice: "User account has been deleted"
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email)
    end

    def check_access
      redirect_to new_user_session_path unless params[:id] == current_user.id.to_s
    end
end
