class V1::ProfilesController < ApplicationController
  def index
    if params[:query] == 'all'
      users = User.where("sub != '#{@sub}'").limit(5)
      profiles = users.map { |user| user.profile unless user.collabs.include(User.find_by(sub: @sub)) }  
      render json: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |profile| profile[:attributes] }
    else
      profiles = Profile.where("name ILIKE ? OR profession ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").limit(5)
      render json: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |profile| profile[:attributes] }
    end
  end

  def show
    user = User.find_by uuid: params[:id]
    user ? render_profile(user.profile) : render_not_found
  end

  def update
    user = User.find_by sub: @sub
    user.profile.update(strong_params)
    render json: { data: ProfileSerializer.new(user.profile).serializable_hash[:data][:attributes], status: 200 }
  end

  def search
    profile = Profile.find_by(url: '/' + params[:endpoint])
    profile ? render_profile(profile) : render_not_found
  end

  private

  def render_profile(profile)
    render json: ProfileSerializer.new(profile).serializable_hash[:data][:attributes]
  end

  def render_not_found
    render json: { status: :unprocessable_entity, errors: ['Record not found'] }
  end

  def strong_params
    params.require(:profile).permit(:id, :name, :birthdate, :profile_picture)
  end
end