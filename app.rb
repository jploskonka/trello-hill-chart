require "sinatra/base"
require 'sinatra/activerecord'
require "sinatra/json"

class Scope < ActiveRecord::Base
  has_many :statuses, class_name: "Scope::Status"
end

class Scope::Status < ActiveRecord::Base
  belongs_to :scope
end

class App < Sinatra::Application
  get "/scopes/:trello_card_id" do
    scope = Scope.find_by(trello_card_id: params["trello_card_id"])
    json progress: scope.statuses.last.progress
  end

  post "/scopes/status" do # trello_card_id
    scope = Scope.find_or_create_by(trello_card_id: params["trello_card_id"])
    scope.statuses.create(progress: params["progress"])
  end
end
