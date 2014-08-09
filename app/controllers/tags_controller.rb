class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    @tag = tag.new(tag_params)

    if @tag.save
      redirect_to @tag
    else
      render 'new'
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
