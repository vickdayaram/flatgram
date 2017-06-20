class PicturesController < ApplicationController


  def index
    @pictures = Picture.all.sort_by {|picture| picture.created_at}
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    if @picture

    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
