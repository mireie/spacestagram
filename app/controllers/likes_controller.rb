class LikesController < ApplicationController
  before_action :find_post

  def create
    if liked?
      flash[:notice] = "You can't like more than once"
    else
      flash[:notice] = "Post Liked!"
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to "/"
  end

  private
  
  def find_post
    @post = Post.find(params[:post_id])
  end

  def liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end
end