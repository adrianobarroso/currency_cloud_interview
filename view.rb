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

  def list_or_seach_recipient
    puts ""
    printf "What is the name of recipient you want to search? If all leave blank. \n->"
    gets.chomp
  end

  def request
    puts "Making API request..."
  end

  def list_recipients(recipients)
    puts "Listing recipients"
    puts "index \t Recipient Name \t Recipient ID"
    recipients["recipients"].each_with_index do |recipient, index|
      puts "#{index} \t #{recipient['name']} \t\t\t #{recipient['id']}"
    end
  end

  def name_recipient
    puts ""
    printf "What is the name of recipient you want to create?\n->"
    gets.chomp
  end

  def list_payments(payments)
    puts "Listing Payments"
    puts "index \t Recipient ID \t\t\t\t Payment ID \t\t\t\t Currency \t Amount"
    payments['payments'].each_with_index do |payment, index|
      puts "#{index} \t #{payment['recipient_id']} \t #{payment['id']} \t #{payment['currency']} \t\t #{payment['amount']}"
    end
  end

  def choose_recipient(recipients)
    puts 'Choose an recipient through its index'
    choose_index = gets.chomp
    recipients["recipients"].each_with_index do |recipient, index|
      return recipient if choose_index.to_i == index
    end
    ''
  end

  def amount_payment(recipient)
    puts "How much you want to pay #{recipient['name']}"
    gets.chomp
  end
end
