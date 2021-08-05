class PostsController < ApplicationController
    # layout false
    skip_before_action :verify_authenticity_token
    before_action :set_post, only: [:edit, :update, :show, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end
    
    def show
    end

    def create
        @post = Post.new(posts_params)
        if @post.save
            flash[:notice] = "Post was created!!"
            redirect_to post_path(@post)
            # redirect_to @post
        else
            flash[:notice] = "Fatal error!!"
        end
    end

    
    def edit
    end

    def update
        if @post.update(posts_params)
            flash[:notice] = "Post was updated!"
            redirect_to post_path(@post)
        else
            flash[:notice] = "Post was not updated! =("
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        flash[:notice] = "Post was destroyed!"
        redirect_to posts_path
    end


    private
    def posts_params
        params.require(:post).permit(:title, :description)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
