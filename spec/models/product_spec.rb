require 'spec_helper'

describe Product do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :user_id }
    it { should belong_to :user }
    it { should belong_to :category }
    it { should have_many :reviews }

    describe '#price' do
      let(:product) { build(:product, price: 1.234) }

      it 'is limited to two decimal places' do
        expect(product).to_not be_valid
      end
    end

    describe '#average_rating' do
      let(:user)    { create(:user) }
      let(:product) { create(:product) }
      let(:review1) { create(:review, rating: 2, user: user, product: product) }
      let(:review2) { create(:review, rating: 3, user: user, product: product) }

      before do
        product.reviews << [review1, review2]
      end

      it 'calculates average rating' do
        expect(product.average_rating).to eq 2.5
      end
    end

    describe '#belongs_to_user?' do
      let(:user)    { create(:user) }
      let(:product) { create(:product, user: user) }

      it 'returnes true if product belongs to user' do
        expect(product.belongs_to_user?(user)).to be true
      end
    end
  end
end
