require 'JSON'
require 'pry-byebug'

require_relative 'lib/user'
require_relative 'lib/view'
require_relative 'lib/controller'
require_relative 'lib/session_user'
require_relative 'lib/router'

session_user = SessionUser.new
@user = session_user.sign_in

controller = Controller.new(@user)
router = Router.new(controller)

# Start the app
router.run
