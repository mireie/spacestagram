class PostsController < ApplicationController
  require "post"

  def index
    if Post.all.size == 0
      self.create_posts
    else
      @posts = Post.all.order(created_at: :desc) 
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def create_posts
    if Post.all.size <= 60
      response = Apod.get_posts(20)
      response.each do |post|
        if post.key?("copyright")
          copyright = post.fetch("copyright")
        else
          copyright = ""
        end
        Post.create(title: post.fetch("title"), image: post.fetch("url"), description: post.fetch("explanation"), copyright: copyright, date: post.fetch("date"))
      end
    end
    redirect_to "/"
  end
end
