class ErrorController < ApplicationController
  def not_found
    render json: {
      error: :not_found,
      message: "Invalid route: #{params[:path]}",
      path: params[:path]
    }, status: 404
  end
end
