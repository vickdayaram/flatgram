class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @picture = Picture.find(params[:picture_id])
  end

  #have to think about when to add the comments, in the
  #picture controller, or here
  def create
    @comment = Comment.new(comment: params[:comment])
    @comment.user_id = current_user.id
    @comment.picture_id = params[:picture_id]
    @picture = Picture.find(params[:picture_id])
    if @comment.save
      redirect_to pictures_path
    else
      render :new
    end
  end

end
