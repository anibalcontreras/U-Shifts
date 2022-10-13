class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @turnos = Turno.all
  end

  def index
    ####
    @users = User.all
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :username, :email, :age, :direccion, :phone, :password, :image)
  end
end
