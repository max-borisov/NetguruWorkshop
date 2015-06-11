require 'spec_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe "user_gravatar" do
    let(:gravatar) { user_gravatar('max@bk.ru', 150) }

    it "has gravatar domain name" do
      expect(gravatar).to include('www.gravatar.com')
    end

    it "has gravatar size specified" do
      expect(gravatar).to include('?s=300')
    end
  end
end
