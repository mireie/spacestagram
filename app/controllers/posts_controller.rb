class PostsController < ApplicationController
  require 'post'
  
  def index
    response = Apod.get_posts()
    @posts = response
    render :index
  end

  def show
    find_me = params[:id]
    @post = Post.get_posts("posts/#{find_me}")
    @post_reviews = Post.get_posts_reviews(find_me)
    render :show
  end

  def create
    @response = Post.post_post(params)
    if @response.response.code === '201'
      flash[:notice] = "#{JSON.parse(@response.body).fetch("name")} Post was successfully created."
      redirect_to("/posts/#{JSON.parse(@response.body).fetch("id").to_s}")
    else
      flash[:alert] = @response.fetch("message")
      render :new
    end
  end

  def destroy
    @response = Post.destroy_post(params)
    if @response.code === 200
      flash[:notice] = @response.fetch("message")
      redirect_to ('/')
    else
      render :show
    end
  end

  def edit
    find_me = params[:id]
    @post = Post.get_posts("posts/#{find_me}")
    render :edit
  end

  def update 
    @response = Post.update_post(params)
    if @response.code === 200
      flash[:notice] = @response.fetch("message")
      redirect_to ('/')
    else
      render :show
    end
  end
end
