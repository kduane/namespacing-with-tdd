class Admin::UsersController < ApplicationController
  before_action :authorize_admin!

  def index
    @users = User.all
  end

  private

  def authorize_admin!
    # binding.pry
    if current_user.role == "admin"
    else
      flash[:notice] = 'You are not authorized.'
      redirect_to :root
    end
  end

end
