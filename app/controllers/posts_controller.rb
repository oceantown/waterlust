class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_user, only: [:edit, :update, :destroy]

  # GET
  def index
    @posts = Post.all.order("created_at DESC")
  end

  # GET
  def show
    @post = Post.find params[:id]
  end

  # GET
  def new
    @post = current_user.posts.build
  end

  # POST
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # DELETE
  def destroy
    @post.destroy
    redirect_to root_path
  end

private

  # GET
  def edit
  end

  # PATCH
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
  end
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :link, :description, :image)
  end
end
