class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: SessionsSerializer.recall_session(user), status: 200
    else
      render json: { error: "Invalid credentials" }, status: :bad_request
    end
  end
end
