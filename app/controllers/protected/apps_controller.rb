class Protected::AppsController < Protected::ApplicationController
  respond_to :json

  def index
    gon.apps = App.all
  end

  def update
    visited_apps = JSON.parse(params['apps'])
    visited_apps.each do |visited_app|
      id = visited_app['_id']['$oid']
      unless current_user.visited_apps.where(app_id: id).exists?
        app = App.find(id)
        current_user.visited_apps.create(app: app)
      end
    end
    render json: { status: 'ok' }
  end
end
