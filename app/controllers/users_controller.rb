class UsersController < ApplicationController
  before_action :require_login, except: :new
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create

    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password]
      )

    if @user.save
    redirect_to user_url(@user)
    else
      render 'new'
    end
      # User.create(
      # name: params[:user][:name],
      # email: params[:user][:email]
      # )
  end

  def login
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    
  end
  
  private
  def require_login
    unless current_user 
      flash[:notice] = "Please log in."
      redirect_to root_url
    end 
  end

end
