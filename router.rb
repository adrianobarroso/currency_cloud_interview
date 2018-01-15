class Router
  def initialize(controller)
    @controller = controller
    # @session_user = session_user
    @running    = true
    @user = nil
  end

  def run
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
    when 1 then @controller.list_recipients
    when 2 then @controller.create_recipient
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
    puts "1 - List or search recipients"
    puts "2 - Create recipient"
    puts "3 - Check Payment"
    puts "4 - Stop and exit the program"
  end
end
