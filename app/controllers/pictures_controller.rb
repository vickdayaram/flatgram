class PicturesController < ApplicationController


  def index
    @pictures = Picture.all.sort_by {|picture| picture.created_at}.reverse
    @user = current_user
  end

  def new
    @picture = Picture.new
    @picture.tags.build
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    create_param_by_name = params[:picture][:tags_attributes]["0"][:name]
    param_tags = params[:picture][:tag_id]
    if !create_param_by_name.empty?
      @picture.tags << Tag.create(name: params[:picture][:tags_attributes]["0"][:name])
    end
    if param_tags != nil
      tags = param_tags.collect {|tag_id| Tag.all.find(tag_id)}
        tags.each do |tag|
        @picture.tags << tag
        end
    end 
    if @picture.save
         redirect_to picture_path(@picture)
    else
         #redirecting right now, was having issues with rendering, revisit
         redirect_to new_picture_path
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
    @picture.tags.build
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to picture_path(@picture)
    else
      redirect_to pictures_path
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(current_user.id)
  end

end
