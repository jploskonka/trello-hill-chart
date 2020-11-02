ENV['APP_ENV'] = "test"

require_relative "../app.rb"
require "database_cleaner/active_record"
require "rspec"
require "rack/test"

module InitializeApp
  def app
    App.new
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include InitializeApp

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
