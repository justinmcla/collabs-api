class V1::UsersController < ApplicationController
  def index
    if params['query'] == 'all'
      profiles = User.all.map{ |user| user.profile }
      render json: { data: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |profile| profile[:attributes] }, status: 200 }
    else
      profiles = Profile.where("name ILIKE ? OR profession ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").limit(5)
      render json: { data: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |profile| profile[:attributes] }, status: 200 }
    end
  end

  def show
    user = User.find_by uuid: params[:id]
    user ? render_profile(user.profile) : render_not_found
  end

  private

  def render_profile(profile)
    render json: ProfileSerializer.new(profile).serializable_hash[:data][:attributes]
  end

  def render_not_found
    render json: { status: :unprocessable_entity, errors: ['Record not found'] }
  end

end