class PostsController < ApplicationController
  require "post"

  def index
    if Post.all.size < 20
      self.create_posts
    end
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def create_posts
    response = Apod.get_posts(3)
    response.each do |post|
      if post.key?("copyright")
        copyright = post.fetch("copyright")
      else
        copyright = ""
      end
      Post.create(title: post.fetch("title"), image: post.fetch("url"), description: post.fetch("explanation"), copyright: copyright, date: post.fetch("date"))
    end
  end
end
