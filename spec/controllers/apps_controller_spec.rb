require 'rails_helper'

describe Protected::AppsController do
  include_context :gon

  describe 'GET index' do
    login_user

    it 'passes apps to Javascript using gon' do
      FactoryGirl.create(:app)
      get :index
      expect(gon['apps'].count).to eq(1)
    end
  end
end
