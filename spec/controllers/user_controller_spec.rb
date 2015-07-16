require 'spec_helper'

describe UsersController do
  let!(:user) { create(:user) }

  before do
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

  describe 'PUT update' do
    describe 'with valid attributes' do
      let(:valid_attributes) do
      {
        firstname: 'Jim',
        lastname: 'Bakon'
      }
      end

      it 'redirects user to the login page' do
        put :update, { id: user.to_param, user: valid_attributes }
        expect(response).to redirect_to(user_path)
        expect(flash[:notice]).to eq('User profile was updated')
      end
    end

    describe 'with valid attributes' do
      let(:valid_attributes) do
      {
        firstname: ''
      }
      end

      it "renders 'show' template" do
        put :update, { id: user.to_param, user: valid_attributes }
        expect(response).to render_template('show')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested user' do
      expect {
        delete :destroy, { id: user.to_param }
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the sign up page' do
      delete :destroy, { id: user.to_param }
      expect(response).to redirect_to(new_user_registration_path)
      expect(flash[:notice]).to eq('User account has been deleted')
    end
  end
end
