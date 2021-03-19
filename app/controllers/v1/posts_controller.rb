class V1::PostsController < ApplicationController
  def index
    render json: { data: PostSerializer.new(Post.all).serializable_hash[:data].map{ |post| post[:attributes] }, status: 200 }
  end 

  def create
  end
end