# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BetaBudget::Application.initialize!

# Format the logger
class Logger
  def format_message(level, time, progname, msg)
    "#{time.to_s(:db)} #{level} -- #{msg}\n"
  end 
end
