class Router
  def initialize(controller, session_user)
    @controller = controller
    @session_user = session_user
    @running    = true
    @user = nil
  end

  def run
    @user = @session_user.sign_in

    while @running
      puts ""
      puts "Welcome to the CoolAPI interface!"
      puts "           --           "
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.add_recipient
    when 2 then @controller.send_money
    when 3 then @controller.check_payment
    when 4 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Add recipients"
    puts "2 - Send Money"
    puts "3 - Check Payment"
    puts "4 - Stop and exit the program"
  end
end
