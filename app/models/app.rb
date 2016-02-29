class App
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :urls, type: Array
end
