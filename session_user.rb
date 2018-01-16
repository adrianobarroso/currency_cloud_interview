class SessionUser
  def initialize
    @view = View.new
  end

  def sign_in
    # name, pass = @view.login_welcome
    @user = User.new('Adriano', "CDA8772865C0CC3C")
    @user.authenticate
    if @user.logged?
      greeting(@user)
      return @user
    end
    puts 'Wrong credentials'
    sign_in
  end

  def greeting(user)
    puts "Welcome to the CoolAPI interface!"
    puts ""
    puts "You are now authenticated:"
    puts ""
    puts "user: #{user.name}"
    puts "apikey: #{user.apikey}"
    puts "token: #{user.token}"
    puts ""
  end
end
