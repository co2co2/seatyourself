
class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    if @user.save
      flash[:notice] = "You have been successfully REBORN!!!!"
      redirect_to root_url

    else
      render :edit
    end
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end
end
