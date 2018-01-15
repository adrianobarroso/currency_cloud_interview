class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    while @running
      puts ""
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
    when 3 then @controller.list_payments
    when 4 then @controller.send_payment
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
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
    puts "3 - List Payments"
    puts "4 - Send Payment"
    puts "5 - Stop and exit the program"
  end
end
