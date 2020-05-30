class ApplicationController < ActionController::API
  def welcome
    render json: { message: "welcome to aes-sales site"}, status: :ok
  end
end
