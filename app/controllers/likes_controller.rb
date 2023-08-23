class LikesController < ApplicationController

  def create
    id1 = params[:ids][:id1]
    id2 = params[:ids][:id2]
    @like = Like.new(user_id: id1, post_id: id2)
    @like.save
    redirect_to posts_path
  end

  def destroy
    like = Like.find(params[:like_id])
    like.destroy
    redirect_to posts_path
  end

end
