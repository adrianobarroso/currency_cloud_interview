class SessionUser
  def initialize
    @view = View.new
  end

  def sign_in
    # 1. Ask the view to welcome user
    # username, pass = @view.login_welcome
    @user = User.new('Adriano', "CDA8772865C0CC3C")
    # 4. Ask the repo for an employee with that username
    @user.authenticate
    # 5. Verify if the password matches
    return @user if @user.logged?
    puts 'Wrong credentials'
    sign_in
  end
end
