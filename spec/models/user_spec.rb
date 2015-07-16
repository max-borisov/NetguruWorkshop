require 'spec_helper'

describe User do
  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should have_many(:products).dependent(:destroy) }
  it { should have_many(:reviews).dependent(:destroy) }

  it "by default isn't admin" do
    expect(User.new).to_not be_admin
  end
end
