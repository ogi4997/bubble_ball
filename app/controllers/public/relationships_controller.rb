class Public::RelationshipsController < ApplicationController

	before_action :authenticate_user!

  def matcher
    @user = current_user
  	@users = current_user.matcher
  end
  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
    @user = User.find(params[:user_id])
  end

  def follower
    @user = User.find(params[:user_id])
    @users = @user.following_user
  end

  def followed
    @user = User.find(params[:user_id])
    @users = @user.follower_user
  end

end
