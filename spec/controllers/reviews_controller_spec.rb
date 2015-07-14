require 'spec_helper'

describe ReviewsController do
  let(:category) { create(:category) }
  let(:product) { create(:product, category_id: category.id) }
  let(:user) { create(:user) }

  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

  describe 'POST create' do
    let(:valid_attributes) do
      {
        content: "hello",
        rating: 4
      }
    end
    let(:invalid_attributes) do
      {
        content: "",
        rating: 40
      }
    end

    describe 'with valid atrributes' do
      it 'creates a new Review' do
        expect {
          post :create, { category_id: category.to_param, product_id: product.to_param, review: valid_attributes }
        }.to change(Review, :count).by(1)
      end

      it 'exposes a newly created review as #review' do
        post :create, { category_id: category.to_param, product_id: product.to_param, review: valid_attributes }
        expect(controller.review).to be_a(Review)
        expect(controller.review).to be_persisted
      end

      it 'redirects to the product page' do
        post :create, { category_id: category.to_param, product_id: product.to_param, review: valid_attributes }
        expect(response).to redirect_to(category_product_path(product.category, category))
        expect(flash[:notice]).to eq('Review was successfully created')
      end
    end

    describe 'with invalid atrributes' do
      it 'exposes a newly created but unsaved review' do
        Review.any_instance.stub(:save).and_return(false)
        post :create, { category_id: category.to_param, product_id: product.to_param, review: valid_attributes }
        expect(controller.review).to be_a_new(Review)
      end

      it "re-renders the 'new' template" do
        Review.any_instance.stub(:save).and_return(false)
        post :create, { category_id: category.to_param, product_id: product.to_param, review: valid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:review) { create(:review, user_id: user.id, product_id: product.id) }

    it 'destroys the requested review' do
      expect {
        delete :destroy, { category_id: category.to_param, product_id: product.to_param, id: review.to_param }
      }.to change(Review, :count).by(-1)
    end

    it 'redirects to the product page' do
      delete :destroy, { category_id: category.to_param, product_id: product.to_param, id: review.to_param }
      expect(response).to redirect_to(category_product_path(product.category, category))
      expect(flash[:notice]).to eq('Review was successfully destroyed')
    end

    context 'login as other user' do
      let(:user2) { create(:user) }

      before do
        sign_in user2
        controller.stub(:user_signed_in?).and_return(true)
        controller.stub(:current_user).and_return(user2)
        controller.stub(:authenticate_user!).and_return(user2)
      end

      it 'shows error message' do
        delete :destroy, { category_id: category.to_param, product_id: product.to_param, id: review.to_param }
        expect(response).to redirect_to(category_product_path(product.category, category))
        expect(flash[:error]).to eq('You do not have credentials to delete that review')
      end
    end
  end
end
