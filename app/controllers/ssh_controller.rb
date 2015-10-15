class SshController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before_action do
  #   if params[:token] != 'token'
  #     render status: 401, json: {message: 'Authentication failed.'}
  #   end
  #   params.delete :token
  # end

  def show
    render json: {message: 'OK', http: 'GET'}
  end
end
