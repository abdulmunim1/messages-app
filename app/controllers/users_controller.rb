class UsersController < ApplicationController
    def save_token
      current_user.save_token params[:token]
      redirect_to root_path
    end
  end