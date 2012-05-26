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
                              
       option :fields, ["id", "nickname","profileUrl","thumbnailUrl"]
       uid { access_token.params[:user_id] }
       
        info do
        {
          :nickname => raw_info['nickname'],
          :image => raw_info['profileUrl'],
          :urls => {'public_profile' => raw_info['thumbnailUrl']}
        }
      end
      
       extra do
        { 'raw_info' => raw_info }
      end
      
    end
  end
end