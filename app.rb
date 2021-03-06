require "sinatra/base"
require 'sinatra/activerecord'
require "sinatra/json"
require "sinatra/cross_origin"

class Scope < ActiveRecord::Base
  has_many :statuses, class_name: "Scope::Status"
end

class Scope::Status < ActiveRecord::Base
  belongs_to :scope
end

class App < Sinatra::Application
  configure do
    enable :corss_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = "*"
  end

  get "/scopes/:trello_card_id" do
    if scope = Scope.find_by(trello_card_id: params["trello_card_id"])
      json progress: scope.statuses.last&.progress
    else
      json progress: 0
    end
  end

  post "/scopes/status" do # trello_card_id
    scope = Scope.find_or_create_by(trello_card_id: params["trello_card_id"])
    scope.statuses.create(progress: params["progress"])
  end
end
