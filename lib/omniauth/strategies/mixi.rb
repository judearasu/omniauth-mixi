require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Mixi < OmniAuth::Strategies::OAuth2
      option :name, 'mixi'
      option :client_options,{:site => 'https://mixi.jp/',
                              :authorize_url => 'https://mixi.jp/connect_authorize.pl',
                              :access_token_url => 'https://secure.mixi-platform.com/2/token'
                              }

      option :fields, ["id", "nickname","profileUrl","thumbnailUrl"]

      uid{ raw_info['id'] }

      info do
        {
          'nickname' => raw_info['entry']['displayName'],
          'image' => raw_info['entry']['thumbnailUrl'],
          'urls' => {:profile => raw_info['entry']['profileUrl']}
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get("/people/@me/@self?format=json").body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
        end

    end
  end
end