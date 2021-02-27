class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(sub: @sub)
    if user
      session[:user_id] = user.id
    else
      user = User.create(sub: @sub)
      session[:user_id] = user.id
    end
    render json: { sub: user.sub, status: :ok }
  end

end