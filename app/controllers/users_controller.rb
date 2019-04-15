class UsersController < ApplicationController

  def index
  @users = User.all
  end

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create
  @user = User.new(params.require(:user).permit!)

  if @user.save
    redirect_to @user
  else
    render :new
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  @user.update(params.require(:user).permit!)
  if @user.save
    redirect_to @user
  else
    render :edit
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  flash[:notice] = "User deleted."
  redirect_to users_path
end
end
