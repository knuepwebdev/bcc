class VisitedApp
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :app
  belongs_to :user
end
