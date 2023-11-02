class CommentsController < ApplicationController
  before_action :set_comment, only: [ :destroy ]
  before_action :require_appropriate_user, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user

    @comment.save

    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

    def set_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def require_appropriate_user
      if current_user.id != @comment.user_id
        flash[:alert] = "You must be creator of that comment to handle that operation"
        redirect_to @post
      end
    end
end
