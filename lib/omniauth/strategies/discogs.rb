require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Discogs < OmniAuth::Strategies::OAuth

      option :name, 'discogs'

      option :client_options, {
        :site => 'https://api.discogs.com/',
        :request_token_path => '/oauth/request_token',
        :access_token_path => '/oauth/access_token',
        :authorize_url => 'https://www.discogs.com/oauth/authorize',
      }

      uid { raw_info['id'] }

      info do
        {
          'username' => raw_info['username'],
          'picture' => raw_info['picture']
        }
      end

      extra do
        {:user_info => raw_info}
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get("/oauth/identity").body)
      end
    end
  end
end
