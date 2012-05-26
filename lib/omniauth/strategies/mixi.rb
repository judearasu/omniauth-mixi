require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Mixi < OmniAuth::Strategies::OAuth2
      option :name, 'mixi'
      option :client_options,{:site => 'http://api.mixi-platform.com/'}
    end
  end
end