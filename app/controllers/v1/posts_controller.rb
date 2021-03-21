class V1::PostsController < ApplicationController
  def index
    if params['query'] == 'all'
      posts = Post.all.limit(20).order(created_at: :desc)
      render json: { data: PostSerializer.new(posts).serializable_hash[:data].map{ |post| post[:attributes] }, status: 200 }
    else
      posts = Post.where("title ILIKE ? OR content ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").order(created_at: :desc)
      render json: { data: PostSerializer.new(posts).serializable_hash[:data].map{ |post| post[:attributes] }, status: 200 }
    end
  end 

  def create
    user = User.find_by sub: @sub
    post = Post.new(strong_params)
    post.author = user
    if post.save
      render json: { data: PostSerializer.new(post).serializable_hash[:data][:attributes], status: 200 }
    else
      render json: { errors: ['Unable to create post'], status: 422 }
    end
  end

  private

  def strong_params
    params.require(:post).permit(:id, :title, :content)
  end
end