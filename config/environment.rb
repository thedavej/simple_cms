# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:nice] = "%b %d, %Y at %l:%M %p" 
Time::DATE_FORMATS[:abbrev] = "%m/%d/%y, %H:%M:%S" 
