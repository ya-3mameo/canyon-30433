class AccessesController < ApplicationController
  def index
  end

  def new
    @access = Access.new
  end

  def create
    @access = Access.new(acccess_params)
    if @access.valid?
      @access.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def acccess_params
    params.require(:access).permit(:postal_number, :prefecture_id, :city, :house_number, :building, :phone_number, :access_plan).merge(tweet_id: tweet.id)
  end
end
