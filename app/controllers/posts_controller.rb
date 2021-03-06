class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[edit update show destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show; end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to edit_post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @element = @post.elements.build
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def update_status
    @post = Post.find(params[:id])
    @post.update(isHidden: params[:isHidden])
    redirect_to edit_post_path(@post)
  end

  def destroy
    @post.comments.all.each(&:destroy)
    @post.elements.all.each(&:destroy)
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :isHidden)
  end
end
