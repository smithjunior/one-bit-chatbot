require "database_cleaner"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleanner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleanner.start
  end

  config.after(:each) do
    DatabaseCleanner.clean
  end
end
