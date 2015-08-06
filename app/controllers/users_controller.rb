class UsersController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    @user=User.new(user_params)

    respond_to do |format|
      if @user.save
        #Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now

        format.html {redirect_to(@user, notice: 'Now please login')}
        format.json {render json: @user, status: :created, location: @user }
      else
        format.html {render action: 'new'}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
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
