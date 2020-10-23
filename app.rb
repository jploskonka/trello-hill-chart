require "sinatra/base"
require 'sinatra/activerecord'

class Scope < ActiveRecord::Base
  has_many :statuses, class_name: "Scope::Status"
end

class Scope::Status < ActiveRecord::Base
  belongs_to :scope
end

class App < Sinatra::Application
  post "/scopes/status" do # trello_card_id
    scope = Scope.find_or_create_by(trello_card_id: params["trello_card_id"])
    scope.statuses.create(progress: params["progress"])
  end
end
