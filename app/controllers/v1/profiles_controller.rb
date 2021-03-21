class V1::ProfilesController < ApplicationController
  def index
    if params['query'] == 'all'
      profiles = Profile.where.not(user: @user).limit(20)
      render json: {
        data: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |profile| profile[:attributes] }, 
        status: 200 
      }
    else
      profiles = Profile.where.not(user: @user).where("name ILIKE ? OR profession ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").limit(20)
      render json: { 
        data: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |profile| profile[:attributes] }, 
        status: 200 
      }
    end
  end

  def update
    profile = @user.profile
    profile.assign_attributes(strong_params)
    if profile.save 
      render json: { 
        data: ProfileSerializer.new(profile).serializable_hash[:data][:attributes], 
        status: 200 
      }
    else
      render json: {
        errors: profile.errors,
        status: 422
      }
    end 
  end

  def search
    profile = Profile.find_by(url: params[:endpoint])
    if profile 
      render json: { 
        data: ProfileSerializer.new(profile).serializable_hash[:data][:attributes],
        status: 200
      }
    else
      render json: {
        errors: ['Record not found'],
        status: 422
      }
    end
  end

  private

  def strong_params
    params.require(:profile).permit(
      :id, :name, :birthdate, :profession, :about, :url, 
      :city, :state, :zip, :profile_picture,
      :facebook, :github, :instagram, :linkedin, :medium, 
      :twitter, :youtube, :twitch
    )
  end
end