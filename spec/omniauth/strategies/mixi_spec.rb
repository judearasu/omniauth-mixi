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
      subject.options.client_options.site.should eq("https://mixi.jp/")
    end

    it 'should have authorize url' do
      subject.options.client_options.authorize_url eq("https://mixi.jp/connect_authorize.pl")
    end
    
    it 'should have access token url' do
      subject.options.client_options.access_token_url eq("https://secure.mixi-platform.com/2/token")
    end
  end
  
  context '#uid' do
    before :each do
      subject.stub(:raw_info) { { 'id' => '123' } }
    end

    it 'returns the id from raw_info' do
      subject.uid.should eq('123')
    end
  end

end

