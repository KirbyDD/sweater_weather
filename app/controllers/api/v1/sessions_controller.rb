class Api::V1::SessionsController < ApplicationController
  def show
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: {error: "Incorrect Email and/or Password"}, status: 400
    end
  end
end
