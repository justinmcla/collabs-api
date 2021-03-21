class ApplicationController < ActionController::API
  include Secured
  before_action :set_current_user
  
  private

  def set_current_user
    @user = User.find_by sub: @sub
  end
end
