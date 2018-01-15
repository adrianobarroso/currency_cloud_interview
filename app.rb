require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'
require 'JSON'
require 'pry-byebug'

require_relative 'user'
require_relative 'view'
require_relative 'controller'
require_relative 'session_user'
require_relative 'router'

controller = Controller.new
session_user = SessionUser.new
router = Router.new(controller, session_user)

# Start the app
router.run
# values = '{
#   "username": "Adriano",
#   "apikey": "CDA8772865C0CC3C"
# }'
#
# headers = {
#   :content_type => 'application/json'
# }
#
# response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
# puts response
