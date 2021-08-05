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
            redirect_to post_path(@post)
            # redirect_to @post
        else
            render 'new'
        end
    end
    
    def edit
    end

    def update
        if @post.update(posts_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
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
