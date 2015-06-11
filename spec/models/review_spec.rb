require 'spec_helper'

describe Review do
  describe 'validations' do
    it { should validate_presence_of :content }
    it { should validate_presence_of :rating }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :product_id }
    it { should belong_to :user }
    it { should belong_to :product }

    describe '#belongs_to_user?' do
      let(:tom) { create(:user) }
      let(:jack)  { create(:user) }
      let(:product) { create(:product) }
      let(:review) { create(:review, rating: 2, user: tom, product: product) }

      it 'returns true if a review belongs to user' do
        expect(review.belongs_to_user?(tom)).to be true
      end

      it 'returns false if a review does not belongs to user' do
        expect(review.belongs_to_user?(jack)).to be false
      end
    end
  end
end
