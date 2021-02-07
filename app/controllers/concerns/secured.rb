# frozen_string_literal: true
require '././lib/json_web_token.rb'

module Secured
  extend ActiveSupport::Concern

  # Call authenticate_request! before any action in a given controller
  included do 
    before_action :authenticate_request!
  end

  private

  # Call auth_token & handle verification/decode errors
  def authenticate_request!
    auth_token
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'], status: :unauthorized }
  end

  # Grab the token out of the request headers if it is present
  def http_token
    if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  # Wrapper to verify the retrieved token
  def auth_token
    JsonWebToken.verify(http_token)
  end

end 