class UsersController < ApplicationController

  before_filter :authorize_admin, only: [:non_admin, :add_admin]

  def non_admin
    @non_admin = User.non_admin
  end

  def add_admin
    @user = User.find(params[:id])
    @user.admin = true
    @user.save!
    redirect_to '/users/non_admin'
  end

  private

  def authorize_admin
    authenticate_user!
    redirect_to(root_path) unless current_user.admin?
  end

end
