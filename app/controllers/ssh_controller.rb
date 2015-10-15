class SshController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before_action do
  #   if params[:token] != 'token'
  #     render status: 401, json: {message: 'Authentication failed.'}
  #   end
  #   params.delete :token
  # end

  def show
    hostname = ENV['SSH_HOSTNAME']
    username = ENV['SSH_USERNAME']
    keypath = ENV['SSH_KEYPATH']
    begin
      Net::SSH.start(hostname, username, keys: [keypath]) do |ssh|
        output = ssh.exec! "#{params[:cmd]} #{params[:args]}"
        render json: {output: output}
      end
    rescue
      render status: 500, json: {message: 'Something went wrong.'}
    end
  end
end
