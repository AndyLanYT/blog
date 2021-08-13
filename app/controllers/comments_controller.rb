class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[create edit update destroy]
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @post.comments.build(comment_params.merge({ user_id: current_user.id, post_id: params[:post_id] }))

    notice = if @comment.save
               nil
             else
               @comment.errors.full_messages.join('. ') << '.'
             end
    redirect_to post_path(@post), notice: notice
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
