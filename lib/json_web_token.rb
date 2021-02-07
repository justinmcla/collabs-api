# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'JSON'

class JsonWebToken

  def self.verify(token)

    auth0_config = {
      algorithms: 'RS256',
      iss:        'https://dev--db8unc5.us.auth0.com/',
      verify_iss: true,
      aud:        Rails.application.credentials.auth0_api_identifier,
      verify_aud: true
    }

    JWT.decode(token, nil, true, auth0_config) do |header|
      jwks_hash[header['kid']]
    end

  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI('https://dev--db8unc5.us.auth0.com/.well-known/jwks.json')
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    Hash[
      jwks_keys.map do |key|
        [
          key['kid'],
          OpenSSL::X509::Certificate.new(
            Base64.decode64(key['x5c'].first)
          ).public_key
        ]
      end
    ]
  end 

end