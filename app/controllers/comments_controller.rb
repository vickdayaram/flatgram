class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  #have to think about when to add the comments, in the
  #picture controller, or here
  def create
    @comment = Comment.create(comment_params)
    if @comment
    end
  end

end
