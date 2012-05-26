require 'spec_helper'

describe OmniAuth::Strategies::Mixi do
  subject do
    OmniAuth::Strategies::Mixi.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq("mixi")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq("http://api.mixi-platform.com/")
    end

    it 'should have authorize url' do
      subject.options.client_options.authorize_url eq("https://mixi.jp/connect_authorize.pl")
    end
    
    it 'should have access token url' do
      subject.options.client_options.access_token_url eq("https://secure.mixi-platform.com/2/token")
    end
    
  end

end

