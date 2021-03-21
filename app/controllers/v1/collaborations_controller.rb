class V1::CollaborationsController < ApplicationController
  def index
    if @user
      render json: { 
        data: CollaborationSerializer.new(@user.accepted_collaborations).serializable_hash[:data].map{ |collaboration| collaboration[:attributes]}, 
        status: 200 
      }
    else
      render json: { 
        errors: ['No records found'], 
        status: 422 
      }
    end
  end

  def pending
    if @user
      render json: { 
        data: CollaborationSerializer.new(@user.pending_collaborations).serializable_hash[:data].map{ |collaboration| collaboration[:attributes]}, 
        status: 200 
      }
    else 
      render json: {
        errors: ['No records found'],
        status: 422
      }
    end
  end

  def create
    collaboration = Collaboration.new(strong_params)
    collaboration.sender = @user
    if collaboration.save
      render json: {
        data: CollaborationSerializer.new(collaboration).serializable_hash[:data][:attributes],
        status: 200
      }
    else
      render json: {
        errors: collaboration.errors,
        status: 422
      }
    end
  end

  def update
    collaboration = Collaboration.find(params[:id])
    collaboration.assign_attributes(strong_params)
    if collaboration.save
      render json: {
        data: CollaborationSerializer.new(collaboration).serializable_hash[:data][:attributes], 
        status: 200
      }
    else 
      render json: {
        errors: collaboration.errors,
        status: 422
      }
    end
  end

  def destroy
    collaboration = Collaboration.find(params[:id])
    if collaboration
      Collaboration.destroy(params[:id])
      render json: {
        data: params[:id],
        status: 200
      }
    else 
      render json: {
        errors: ['Unable to delete collaboration'],
        status: 422
      }
    end
  end

  private

  def strong_params
    params.require(:collaboration).permit(:id, :sender_id, :receiver_id, :accepted)
  end
end