require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Discogs < OmniAuth::Strategies::OAuth2
      option :name, 'discogs'
      option :client_options, {
        :site => 'https://www.discogs.com/',
        :authorize_url => 'https://www.discogs.com/oauth/authorize',
        :token_url => 'http://api.discogs.com/oauth/access_token'
        # :token_url => 'http://api.discogs.com/oauth/request_token'
      }

      uid { raw_info['id'] }

      info do
        {
          'username' => raw_info['username'],
          'picture' => raw_info['picture']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/oauth/identity').parsed
      end
    end
  end
end