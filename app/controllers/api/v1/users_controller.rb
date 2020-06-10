class Api::V1::UsersController < ApplicationController
  def create
    if check_for_errors
      render json: check_for_errors, status: 400
    else
      user = User.create(user_params)
      user.create_api_key
      render json: UsersSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def check_for_errors
    if params[:password] != params[:password_confirmation]
      {error: "Password and Confirmation Do Not Match"}
    elsif User.find_by(email: params[:email])
      {error: "E-mail Already In Use"}
    elsif !params[:password] || !params[:password_confirmation] || !params[:email]
      {error: "All fields are required"}
    end
  end
end
