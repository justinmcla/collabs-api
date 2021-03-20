class V1::CollaborationRequestsController < ApplicationController
  def index
    user = User.find_by(sub: @sub)
    render json: { 
      data: ProfileSerializer.new(user.pending_collaborations.map{|collaboration| collaboration.profile}).serializable_hash[:data].map{ |collaboration| collaboration[:attributes] },
      status: 200 }
  end

  def show
    user = User.find_by(sub: @sub)
    collab = User.find_by(uuid: params[:id])
    if user.collabs.include?(collab)
      render json: { data: 'accepted', status: 200 }
    elsif user.pending_collaborations.include?(collab)
      render json: { data: 'pending', status: 200 }
    else
      render json: { data: 'not connected', status: 200 }
    end
  end
end