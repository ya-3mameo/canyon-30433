class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_user, only: [:show, :destroy]
  before_action :move_to_index, only: :destroy

  def show
    @tweets = @user.tweets.all.order('created_at DESC')
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.id == user.id
  end

  def set_user
    @user = User.find(params[:id])
  end
end
