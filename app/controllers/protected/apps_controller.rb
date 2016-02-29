class Protected::AppsController < Protected::ApplicationController
  respond_to :json

  def index
    gon.apps = App.all
  end

  def update
    current_user.visited_apps.destroy_all
    visited_apps.each do |visited_app|
      id = visited_app['_id']['$oid']
      app = App.find(id)
      current_user.visited_apps.create(app: app)
    end
    render json: { status: 'ok' }
  end

  private
  def visited_apps
    JSON.parse(params[:visited_apps])
  end
end
