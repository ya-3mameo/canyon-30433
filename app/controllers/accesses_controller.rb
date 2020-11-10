class AccessesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @access = Access.find(@tweet.access.id)
  end

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @access = Access.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @access = Access.new(access_params)
    if @access.valid?
      @access.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def access_params
    params.require(:access).permit(
      :postal_number, :prefecture_id, :city, :house_number,
      :building, :phone_number, :access_plan
    ).merge(
      tweet_id: @tweet.id
    )
  end
end
