class V1::UsersController < ApplicationController
  def index
    if params['query'] == 'all'
      profiles = Profile.where.not(user: @user).limit(20)
      render json: {
        data: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |profile| profile[:attributes] }, 
        status: 200 }
    else
      profiles = Profile.where.not(user: user).where("name ILIKE ? OR profession ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").limit(20)
      render json: { data: ProfileSerializer.new(profiles).serializable_hash[:data].map{ |profile| profile[:attributes] }, status: 200 }
    end
  end

  def show
    user = User.find_by uuid: params[:id]
    render json: { 
      data: ProfileSerializer.new(user.profile).serializable_hash[:data][:attributes], 
      status: 200 
    }
  end
end