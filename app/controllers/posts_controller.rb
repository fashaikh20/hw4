class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  #def create
    #@post = Post.new(params["post"])
    #@post.user_id = session[:user_id]
    #@post.save
    #redirect_to "/places/#{@post.place.id}"
  #end

  def create
    if @current_user
      @post = Post.new(params["post"])
      @post.user_id = @current_user.id
      @post.save
    else
      flash[:notice] = "Please make sure you are logged in."
    end
    redirect_to "/places"
  end




end
