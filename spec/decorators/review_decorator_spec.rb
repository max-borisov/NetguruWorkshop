require 'spec_helper'

describe ReviewDecorator do

  let(:user) { build(:user, firstname: 'John', lastname: 'Doe') }
  let(:review) { described_class.new(build(:review, user: user, created_at: 'Tue, 14 Jul 2015')) }

  describe '#author' do
    it 'displays review author fullname' do
      expect(review.author).to eq 'John Doe'
    end
  end

  describe '#created_at' do
    it 'changes format for created_at' do
      expect(review.decorate.created_at).to eq('14-07-2015')
    end
  end
end
