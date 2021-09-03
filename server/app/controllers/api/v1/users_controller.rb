class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :set_user, only: %i[show update]
  before_action :look_up_user, only: [:show, :update, :destroy]

  def index
    render json: User.all
  end

  def show
    render json: 'User does not exist', status: :no_content unless @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render 'api/users/show'
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @user
      @user.destroy
      header 204
      # render 'api/users/show'
    else
      render json: 'User does not exist', status: :no_content
    end
  end

  private

  def look_up_user
    @user = User.where(id: params[:id]).includes(:playlists, :followed_playlists).first
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :image_url)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
