require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'
require 'JSON'
require 'pry-byebug'

require_relative 'user'
require_relative 'view'
require_relative 'controller'
require_relative 'session_user'
require_relative 'router'

session_user = SessionUser.new
@user = session_user.sign_in
puts "Welcome to the CoolAPI interface!"
puts ""
puts "You are now authenticated:"
puts ""
puts "user: #{@user.name}"
puts "apikey: #{@user.apikey}"
puts "token: #{@user.token}"
puts ""

controller = Controller.new(@user)
router = Router.new(controller)

# Start the app
router.run
