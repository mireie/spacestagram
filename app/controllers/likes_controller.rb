class LikesController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!

  def create
    if liked?
      like = Like.where(user_id: current_user.id, post_id:params[:post_id]).first
      like.destroy
      flash[:notice] = "Like Removed"
    else
      flash[:notice] = "Post Liked!"
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to "/"
  end

  def destroy
    @like.destroy
  end
  private
  
  def find_post
    @post = Post.find(params[:post_id])
  end

  def liked?
    Like.where(user_id: current_user.id, post_id:params[:post_id]).exists?
  end
end