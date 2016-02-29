require 'rails_helper'

describe 'Users', type: :request do
  let(:existing_user) { FactoryGirl.create(:user) }
  let(:log_in_params) {{ user: {email: existing_user.email, password: existing_user.password }}}

  describe 'sign up' do
    it 'should create a new user' do
      expect{
        post user_registration_path, { user: attributes_for(:user) }
      }.to change(User, :count).by(1)
    end
  end

  describe 'log in' do
    it 'should redirect to the user dashboard' do
      post user_session_path, log_in_params
      expect(response).to redirect_to apps_path
    end
  end

  describe 'log out' do
    it 'should redirect to the log in page' do
      delete destroy_user_session_path
      expect(response).to redirect_to log_in_path
    end
  end
end
