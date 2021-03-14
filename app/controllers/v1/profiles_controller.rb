class V1::ProfilesController < ApplicationController
  def show
    user = User.find_by uuid: params[:id]
    render json: { data: user.profile, status: :ok }
  end

  def update
  end
end