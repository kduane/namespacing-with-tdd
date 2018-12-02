class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  private

  def authorize_admin!
    # binding.pry
    if current_user.nil? or !current_user.is_admin?
      flash[:notice] = 'You are not authorized to view this content.'
      redirect_to :root
    end
  end

end
