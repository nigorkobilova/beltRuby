class LikesController < ApplicationController
  def create
    like = Like.new(user:User.find(current_user), post: Post.find(params[:post_id]))
    # binding.pry
    if like.valid?
      like.save
      redirect_to :back
    else
      flash[:errors]=like.errors.full_messages
      redirect_to :back
    end
  end
end
