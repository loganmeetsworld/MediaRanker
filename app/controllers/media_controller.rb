class MediaController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy, :vote] { @medium = Medium.find(params[:id]) }
  before_action only: [ :edit, :destroy, :vote] { @type = @medium.type.pluralize }

  def index
    @media = Medium.where("type = '#{params[:type]}'")
  end

  def show; end

  def new
    @medium = Medium.new
    @type = params[:type]
  end

  def create
    @medium = Medium.create(media_params[:medium])

    if @medium.save
      @media_type = params[:medium][:type]
      redirect_to polymorphic_path(@medium)
    else
      render "new"
    end
  end

  def edit; end

  def update
    media_type = @medium.type.downcase.singularize

    @medium.update(
      creator: params[media_type][:creator], 
      name: params[media_type][:name], 
      description: params[media_type][:description])
    redirect_to @medium
  end

  def destroy
    Medium.destroy(params[:id])
    redirect_to polymorphic_path(@type.downcase)
  end

  def vote
    @medium.update(rank: @medium.rank += 1)
    redirect_to :back
  end

  private

  def media_params
    params.permit(medium:[:name, :creator, :description, :rank, :type])
  end
end
