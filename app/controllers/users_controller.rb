class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_access
  expose_decorated(:reviews, ancestor: :current_user)
  expose_decorated(:user)

  def destroy
    current_user.destroy
    redirect_to new_user_registration_path, notice: "User account has been deleted"
  end

  private

    def check_access
      redirect_to new_user_session_path unless params[:id] == current_user.id.to_s
    end
end
