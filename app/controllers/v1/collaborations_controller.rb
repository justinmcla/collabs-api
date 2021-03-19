class V1::CollaborationsController < ApplicationController
  def index
    user = User.find_by(sub: @sub)
    profiles = user.collabs.map{ |collab| collab.profile }
    render json: { data: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |collaboration| collaboration[:attributes]}, status: 200 }
  end

  def show
    user = User.find_by uuid: params[:id]
    user ? render_collabs(user) : render_not_found
  end

  private

  def render_collabs(user)
    profiles = user.collabs.map{ |collab| collab.profile }
    render json: ProfileSerializer.new(profiles).serializable_hash[:data]
  end

  def render_not_found
    render json: { status: :unprocessable_entity, errors: ['Record not found'] }
  end
end