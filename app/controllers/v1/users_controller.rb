class V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by uuid: params[:id]
    render json: user
  end
end