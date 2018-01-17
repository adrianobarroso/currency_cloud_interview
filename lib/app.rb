require 'JSON'
require 'pry-byebug'

require_relative 'user'
require_relative 'view'
require_relative 'controller'
require_relative 'session_user'
require_relative 'router'

session_user = SessionUser.new
@user = session_user.sign_in

controller = Controller.new(@user)
router = Router.new(controller)

# Start the app
router.run
