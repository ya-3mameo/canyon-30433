class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.all.order('created_at DESC')
  end
end