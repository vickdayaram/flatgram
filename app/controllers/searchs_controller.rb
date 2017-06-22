class SearchsController < ApplicationController

  def index
    if params[:search]
      @tags = Tag.search(params[:search]).order("created_at DESC")
      params[:search] = nil
    else
      @tags = Tag.all.order("created_at DESC")
      params[:search] = nil
    end
    @tags
  end
end
