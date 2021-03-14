class V1::SessionsController < ApplicationController
  def create
    user = User.find_by(sub: @sub) || User.create(sub: @sub)
    render json: { user: user.uuid, status: :ok }
  end
end