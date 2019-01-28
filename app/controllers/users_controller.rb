class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    json_response(@users)
  end

  def create
   @user = User.create!(user_params)
   json_response(@user, :created)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  def show
    json_response(@user)
  end

  private

  def user_params
    params.permit(:username, :password, :user)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
