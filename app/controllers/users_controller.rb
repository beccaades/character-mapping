class UsersController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user=User.new(user_params)
    if @user.save
      redirect_to login_path, :notice => "Now please login"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
