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

  def list_recipients(array)
    puts array
  end

  def list_or_seach_recipient
    puts ""
    printf "What is the name of recipient you want to search? If all leave blank. \n->"
    gets.chomp
  end

  def name_recipient
    puts ""
    printf "What is the name of recipient you want to create?\n->"
    gets.chomp
  end
end
