require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Mixi < OmniAuth::Strategies::OAuth2
      option :name, 'mixi'
      option :client_options,{:site => 'http://api.mixi-platform.com/',
                              :authorize_url => 'https://mixi.jp/connect_authorize.pl',
                              :access_token_url => 'https://secure.mixi-platform.com/2/token'
                              }
    end
  end
end