class PostsController < ApplicationController
  require 'post'

  def index
    self.create_posts
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
      Post.create(title: post.fetch("title"), image: post.fetch("url"), description: post.fetch('explanation'))
    end
    # if @response.response.code === '201'
    #   flash[:notice] = "#{JSON.parse(@response.body).fetch("name")} Post was successfully created."
    #   redirect_to("/posts/#{JSON.parse(@response.body).fetch("id").to_s}")
    # else
    #   flash[:alert] = @response.fetch("message")
    #   render :new
    # end
  end

end
