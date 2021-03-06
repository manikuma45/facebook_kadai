class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "登録しました"  #？？？#
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
    :birthday, :gender)
  end

end
