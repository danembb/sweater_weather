class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    api_key = SecureRandom.hex(25)
    user.update(api_key: api_key)
    if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: "Invalid field" }, status: :bad_request
    elsif params[:password] != params[:password_confirmation]
      render json: { error: "Invalid parameters" }, status: :bad_request
    elsif user.save
      render json: UsersSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
