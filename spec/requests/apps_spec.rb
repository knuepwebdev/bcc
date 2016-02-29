require 'rails_helper'

describe 'Apps', type: :request do
  let(:an_app) { FactoryGirl.create(:app) }
  let(:user) { FactoryGirl.create(:user) }
  let(:app_params) {{ visited_apps: ['_id' => {'$oid' =>  an_app.id.to_s}, name: an_app.name, urls: an_app.urls].to_json }}

  describe "update a user's visited apps" do
    before(:each) { sign_in user }

    context 'newly visited app' do
      it 'saves the app to the database' do
        patch update_apps_path, app_params
        expect(user.visited_apps.count).to eq(1)
      end
    end

    context 'previously visited app' do
      it 'does not create a duplicate record in the database' do
        user.visited_apps.create(app: an_app)
        expect{
          patch update_apps_path, app_params
        }.to change(user.visited_apps, :count).by(0)
      end
    end
  end
end
