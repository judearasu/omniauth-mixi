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

    
  end

end

