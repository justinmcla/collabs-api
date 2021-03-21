class V1::SessionsController < ApplicationController
  skip_before_action :set_current_user

  def create
    user = User.find_by(sub: @sub) || User.create(sub: @sub)
    render json: { id: user.id, user: user.uuid, status: 200 }
  end
end