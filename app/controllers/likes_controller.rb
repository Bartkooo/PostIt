class LikesController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    id1 = params[:ids][:id1]
    id2 = params[:ids][:id2]
    @post = Post.find(id2)
    @like = Like.new(user_id: id1, post_id: id2)
    @like.save
    redirect_to posts_path(@post, anchor: dom_id(@post))
  end

  def destroy
    like = Like.find(params[:like_id])
    @post = Post.find(like.post_id)
    like.destroy
    redirect_to posts_path(@post, anchor: dom_id(@post))
  end

end
