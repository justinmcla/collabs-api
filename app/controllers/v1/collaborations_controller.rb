class V1::CollaborationsController < ApplicationController
  def show
    user = User.find_by uuid: params[:id]
    collabs = user.collabs.map{ |collab| collab.profile}
    render json: { data: collabs, status: :ok }
  end
end