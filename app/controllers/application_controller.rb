class ApplicationController < ActionController::API

  def home
    render json: { message: "Hello World" }
  end
end
