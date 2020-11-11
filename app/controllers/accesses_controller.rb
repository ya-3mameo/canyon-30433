class AccessesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_tweet, only: [:new, :create, :show]
  before_action :set_tweet_id, only: [:edit, :update]
  before_action :set_access, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def new
    @access = Access.new
  end

  def create
    @access = Access.new(access_params)
    if @access.valid?
      @access.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @access.update(access_params)
      redirect_to tweet_access_path(@tweet.id)
    else
      render :edit
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

  def move_to_index
    @tweet = Tweet.find(params[:id])
    @user = User.find(@tweet.user_id)
    redirect_to root_path unless current_user == @user
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def set_tweet_id
    @tweet = Tweet.find(params[:id])
  end

  def set_access
    @access = Access.find(@tweet.access.id)
  end
end
