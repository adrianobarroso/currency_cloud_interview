class View
  def login_welcome
    puts ""
    puts "Please login to use CoolAPI interface"
    puts ""
    printf "username: "
    username = gets.chomp
    printf "password: "
    pass = gets.chomp
    [username, pass]
  end
end
