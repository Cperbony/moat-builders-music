class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password],
    )

    if @user
      login(@user)
      render 'api/users/show'
    else
      render json: [
        'Invalid username or password',
      ], status: :unauthorized
    end
  end

  def destroy
    if @user = current_user
      logout
      render 'api/users/show'
    else
      render json: [
        'No signed in',
      ], status: :not_found
    end
  end
end
